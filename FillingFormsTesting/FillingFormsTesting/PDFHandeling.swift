//---------------------------------------------------------------------------------------
// Copyright (c) 2001-2019 by PDFTron Systems Inc. All Rights Reserved.
// Consult legal.txt regarding legal and license information.
//---------------------------------------------------------------------------------------

import PDFNet
import Foundation

//---------------------------------------------------------------------------------------
// PDFNet includes a full support for FDF (Forms Data Format) and capability to merge/extract
// forms data (FDF) with/from PDF. This sample illustrates basic FDF merge/extract functionality
// available in PDFNet.
//---------------------------------------------------------------------------------------
func runFDFTest() -> Int {
    return autoreleasepool{
        var ret: Int = 0
        
        
        // Example 1)
        // Iterate over all form fields in the document. Display all field names
        do {
            try PTPDFNet.catchException {
                let doc: PTPDFDoc = PTPDFDoc(filepath: Bundle.main.path(forResource: "form1", ofType: "pdf"))
                doc.initSecurityHandler()
                
                let itr: PTFieldIterator = doc.getFieldIterator()
                while (itr.hasNext()) {
                    print("Field name: \(itr.current().getName()!)")
                    print("Field partial name: \(itr.current().getPartialName()!)")
                    
                    print("Field type: ")
                    let type: PTFieldType = itr.current().getType()
                    switch type {
                    case e_ptbutton:
                        print("Button")
                    case e_pttext:
                        print("Text")
                    case e_ptchoice:
                        print("Choice")
                    case e_ptsignature:
                        print("Signature")
                    default:
                        break
                    }
                    
                    print("------------------------------")
                    itr.next()
                }
                
                print("Done")
            }
        } catch let e as NSError {
            print("\(e)")
            ret = 1
        }
        
        // Example 2)
        // Import XFDF into FDF, then merge data from FDF into PDF
        do {
            try PTPDFNet.catchException {
                // XFDF to FDF
                // form fields
                print("Import form field data from XFDF to FDF.")
                
                let fdf_doc1: PTFDFDoc = PTFDFDoc.create(fromXFDF: Bundle.main.path(forResource: "form1_data", ofType: "xfdf"))
                fdf_doc1.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_data.fdf").path)
                
                // annotations
                print("Import annotations from XFDF to FDF.")
                
                let fdf_doc2: PTFDFDoc = PTFDFDoc.create(fromXFDF: Bundle.main.path(forResource: "form1_annots", ofType: "xfdf"))
                fdf_doc2.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_annots.fdf").path)
                
                // FDF to PDF
                // form fields
                print("Merge form field data from FDF.")
                
                let doc: PTPDFDoc = PTPDFDoc(filepath: Bundle.main.path(forResource: "form1", ofType: "pdf"))
                doc.initSecurityHandler()
                doc.fdfMerge(fdf_doc1)
                
                // To use PDFNet form field appearance generation instead of relying on
                // Acrobat, uncomment the following two lines:
                //doc.refreshFieldAppearances()
                //doc.getAcroForm().putBool("NeedAppearances", value: false)
                
                doc.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled.pdf").path, flags: e_ptlinearized.rawValue)
                
                print("Merge annotations from FDF.")
                
                doc.fdfMerge(fdf_doc2)
                doc.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_with_annots.pdf").path, flags: e_ptlinearized.rawValue)
                print("Done.")
            }
        } catch let e as NSError {
            print("\(e)")
            ret = 1
        }
        
        // Example 3) Extract data from PDF to FDF, then export FDF as XFDF
        do {
            try PTPDFNet.catchException {
                // PDF to FDF
                let in_doc: PTPDFDoc = PTPDFDoc(filepath: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_with_annots.pdf").path)
                in_doc.initSecurityHandler()
                
                // form fields only
                print("Extract form fields data to FDF.")
                
                let doc_fields: PTFDFDoc = in_doc.fdfExtract(e_ptforms_only)
                doc_fields.setPDFFileName("../form1_filled_with_annots.pdf")
                doc_fields.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_data.fdf").path)
                
                // annotations only
                print("Extract annotations to FDF.")
                
                let doc_annots: PTFDFDoc = in_doc.fdfExtract(e_ptannots_only)
                doc_annots.setPDFFileName("../form1_filled_with_annots.pdf")
                doc_annots.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_annot.fdf").path)
                
                // both form fields and annotations
                print("Extract both form fields and annotations to FDF.")
                
                let doc_both: PTFDFDoc = in_doc.fdfExtract(e_ptboth)
                doc_both.setPDFFileName("../form1_filled_with_annots.pdf")
                doc_both.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_both.fdf").path)
                
                // FDF to XFDF
                // form fields
                print("Export form field data from FDF to XFDF.")
                
                doc_fields.save(asXFDF: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_data.xfdf").path)
                
                // annotations
                print("Export annotations from FDF to XFDF.")
                
                doc_annots.save(asXFDF: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_annot.xfdf").path)
                
                // both form fields and annotations
                print("Export both form fields and annotations from FDF to XFDF.")
                
                doc_both.save(asXFDF: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_both.xfdf").path)
                
                print("Done.")
            }
        } catch let e as NSError {
            print("\(e)")
            ret = 1
        }
        
        // Example 4) Merge/Extract XFDF into/from PDF
        do {
            try PTPDFNet.catchException {
                // Merge XFDF from string
                let in_doc: PTPDFDoc = PTPDFDoc(filepath: Bundle.main.path(forResource: "numbered", ofType: "pdf"))
                in_doc.initSecurityHandler()
                
                print("Merge XFDF string into PDF.")
                let str = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?><xfdf xmlns=\"http://ns.adobe.com/xfdf\" xml:space=\"preserve\"><square subject=\"Rectangle\" page=\"0\" name=\"cf4d2e58-e9c5-2a58-5b4d-9b4b1a330e45\" title=\"user\" creationdate=\"D:20120827112326-07'00'\" date=\"D:20120827112326-07'00'\" rect=\"227.7814207650273,597.6174863387978,437.07103825136608,705.0491803278688\" color=\"#000000\" interior-color=\"#FFFF00\" flags=\"print\" width=\"1\"><popup flags=\"print,nozoom,norotate\" open=\"no\" page=\"0\" rect=\"0,792,0,792\" /></square></xfdf>"
                
                let fdoc = PTFDFDoc.create(fromXFDF: str)
                in_doc.fdfMerge(fdoc)
                in_doc.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("numbered_modified.pdf").path, flags: e_ptlinearized.rawValue)
                
                print("Merge complete.")
                
                // Extract XFDF as string
                print("Extract XFDF as a string.")
                let fdoc_new: PTFDFDoc = in_doc.fdfExtract(e_ptboth)
                let XFDF_str: String = fdoc_new.saveAsXFDFToString()
                print("Extracted XFDF: ")
                print("\(XFDF_str)")
                print("Extract complete.")
            }
        } catch let e as NSError {
            print("\(e)")
            ret = 1
        }
        
        // Example 5) Read FDF files directly
        do {
            try PTPDFNet.catchException {
                let doc: PTFDFDoc = PTFDFDoc(filepath: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_data.fdf").path)
                
                let itr: PTFDFFieldIterator = doc.getFieldIterator()
                while itr.hasNext() {
                    print("Field name: \(itr.current().getName()!)")
                    print("Field partial name: \(itr.current().getPartialName()!)")
                    
                    print("------------------------------")
                    itr.next()
                }
                
                print("Done.")
            }
        } catch let e as NSError {
            print("\(e)")
            ret = 1
        }
        
        // Example 6) Direct generation of FDF.
        do {
            try PTPDFNet.catchException {
                let doc: PTFDFDoc = PTFDFDoc()
                // Create new fields (i.e. key/value pairs).
                doc.fieldCreate(with: "Company", type: e_pttext, field_value: "PDFTron Systems")
                doc.fieldCreate(with: "First Name", type: e_pttext, field_value: "John")
                doc.fieldCreate(with: "Last Name", type: e_pttext, field_value: "Doe")
                // ...
                
                //doc.setPDFFileName("mydoc.pdf")
                
                doc.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("sample_output.fdf").path)
                print("Done.")
            }
        } catch let e as NSError {
            print("\(e)")
            ret = 1
        }
        
        return ret
    }
}
