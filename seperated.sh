#!/bin/bash

if [[ -f 'config/config_seperated.sh' ]]; then
    source config/config_seperated.sh
fi
mkdir -p $seperated_path/{fo,pdf,xml}
searchstring=".xml"
cd $input_path
for i in *.xml; do java -jar "${sax_jar}" "$i" "${tei_xsl_seperated}" > "${sep_xml}/$i" && \
 java -jar "${sax_jar}" "${sep_xml}/$i" "${xslfo_xsl_seperated}" > "${sep_fo}/${i%$searchstring*}.fo" && \
FOP_OPTS="${fop_opts}" "${fop_bin}" -c "${fop_conf}" "${sep_fo}/${i%$searchstring*}.fo" "${sep_pdf}/${i%$searchstring*}.pdf"; done


if "$cleanup"; then
    mv $sep_pdf $output_path
    rm -r $seperated_path
fi