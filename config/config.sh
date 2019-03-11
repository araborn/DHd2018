#!/bin/bash
dhd=`pwd`
# locate saxon jar file
sax_jar=$dhd/lib/SaxonHE9-9-0-2J/saxon9he.jar

# locate FOP base directory
fop_lib=$dhd/lib/fop-2.3

# for hyphenation, you will also need 'offo hyphenation binaries': 
# simply place 'fop-hyph.jar' in 'fop/lib' 

# additional options for FOP processing (sent to the java process)
#   -d64: optimization for 64 bit processor
#   -Xmx3000m: sets the maximum available memory allocation pool to 3000 MB
# Note: It's safe to leave this variable blank
fop_opts="-d64 -Xmx3000m"

# these variables shouldn't need to be changed, they are relative to fop_lib
fop_bin=${fop_lib}/fop
fop_conf=${fop_lib}/conf/fop.xconf

fo_obj=output/pdf.fo
pdf_obj=output/pdf.pdf

tei_xsl=lib/tei2pdf/TEIcorpus_producer.xsl
xslfo_xsl=$dhd/lib/tei2pdf/xsl-fo-producer.xsl
init_xml=lib/tei2pdf/empty.xml
final_xml=output/Book_Corpus.xml

seperated_path=$dhd/output/seperated
sep_xml=$seperated_path/xml
sep_pdf=$seperated_path/pdf
sep_fo=$seperated_path/fo

tei_xsl_seperated=$dhd/lib/tei2pdf/TEIcorpus_producer-seperated.xsl


# further options that may be useful

# cleanup transitional files when finished
cleanup=false
