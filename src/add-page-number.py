#!/usr/bin/env python3
# -*- coding: utf-8 -*-

helpDoc = '''
Add Page Number to PDF file with Python 
usage:
    python3 add-page-number.py [PDF path] 
require:
    pip install reportlab pypdf2
    Support both Python2/3, But more recommend Python3

tips:
    * output file will save at the same inpurt path with the suffix "_numbered" in the file name. E.G. test.pdf => test_numbered.pdf 
    * only support A4 size PDF
    * tested on Python3@ubuntu
    * more large size of PDF require more RAM 

Author:
    @author: schengatto@gmail.com
'''
print(helpDoc)

import sys
import reportlab
from reportlab.lib.units import mm
from reportlab.pdfgen import canvas
from pathlib import Path

from PyPDF2 import PdfWriter, PdfReader

def createPagePdf(num, tmp):
    c = canvas.Canvas(tmp)
    for i in range(1,num+1): 
        c.drawString((210//2)*mm, (4)*mm, str(i))
        c.showPage()
    c.save()
    return 
    with open(tmp, 'rb') as f:
        pdf = PdfReader(f)
        layer = pdf.getPage(0)
    return layer


if __name__ == "__main__":
    pass
    import sys,os

    #The path of the pdf file must be provided as first arugment
    if len(sys.argv) == 1:
        sys.exit(1)

    output_folder = str(Path.home()) + "/pdf-numbered-output/"
    if len(sys.argv) >= 3:
        output_folder = sys.argv[2]

    position = "center"
    if len(sys.argv) >= 4:
        position = sys.argv[3]

    size = "10pt"
    if len(sys.argv) >= 5:
        size = sys.argv[4]

    pdf_path = sys.argv[1]
    pdf_file_name = os.path.basename(pdf_path)
    output_folder = pdf_path.replace(pdf_file_name, "")

    tmp = "__tmp.pdf"

    batch = 10
    batch = 0
    output = PdfWriter()
    with open(pdf_path, 'rb') as f:
        pdf = PdfReader(f,strict=False)
        number_of_pages = len(pdf.pages)
        if batch == 0:
            batch = -number_of_pages
        createPagePdf(number_of_pages,tmp)
        # if not os.path.isdir(output_folder):
            # os.mkdir(output_folder)
        with open(tmp, 'rb') as ftmp:
            number_pdf = PdfReader(ftmp)
            for page_number in range(number_of_pages):
                if not page_number%batch and page_number:
                    newpath = pdf_path.replace(pdf_file_name, output_folder+ pdf_file_name[:-4] + '_page_%d'%(page_number//batch) + pdf_path[-4:])
                    with open(newpath, 'wb') as f:
                        output.write(f)
                    output = PdfWriter()
                print('page: %d of %d'%(page_number, number_of_pages))
                page = pdf.pages[page_number]
                numberLayer = number_pdf.pages[page_number]

                page.merge_page(numberLayer)
                output.add_page(page)
            if len(output.pages):
                newpath = output_folder + pdf_file_name[:-4] + "_numbered" + pdf_path[-4:]
                with open(newpath, 'wb') as f:
                    output.write(f)

        os.remove(tmp)