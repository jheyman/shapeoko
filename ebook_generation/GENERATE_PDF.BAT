# clone the ebook repo (https://github.com/jheyman/shapeoko_a_to_z) locally, then run this in the main directory
copy README.md + workflow.md + anatomy-of-a-shapeoko.md + cad-cam-tools.md + cutters.md + feeds-and-speeds-basics.md + toolpath-basics.md + workholding.md + dust-collection.md + first-cuts.md + squaring.md + x-y-z-calibration.md + cutting-wood.md + cutting-plastics.md + cutting-metal.md + maintenance.md + upgrading-the-machine.md concatenated.md

C:\Python27\python.exe preprocess_md.py

# PDF generation now done natively in gitbook using "Export as PDF" 
#pandoc -o Shapeoko_A_to_Z_v2.pdf concatenated_processed.md

pandoc -t epub -o Shapeoko_A_to_Z_v3.epub -H chapter_break.tex -V geometry:margin=1in concatenated_processed.md
