#!/bin/bash

if [[ -f 'config/config.sh' ]]; then
    source config/config.sh
fi
searchstring=".xml"
cd input/xml
for i in *.xml; do java -jar "${sax_jar}" "$i" "${tei_xsl_seperated}" > "${sep_xml}/$i" && \
 java -jar "${sax_jar}" "${sep_xml}/$i" "${xslfo_xsl}" > "${sep_fo}/${i%$searchstring*}.fo" && \
FOP_OPTS="${fop_opts}" "${fop_bin}" -c "${fop_conf}" "${sep_fo}/${i%$searchstring*}.fo" "${sep_pdf}/${i%$searchstring*}.pdf"; done


#cd input/xml
#for i in *.xml; do java -classpath ../../$sax_jar net.sf.saxon.Transform -s:$i -xsl:../../lib/tei2pdf/TEIcorpus_producer-seperated.xsl -o:../../output/seperated/$i;  done