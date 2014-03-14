#!/bin/sh

# Set metadata
   bundleID="elecwiz";
 bundleName="Electric Wizardry";
projectName="Electric Wizardry"
    company="Electric Wizardry, LLC";
  companyID="com.electric-wizardry";
 companyURL="http://electric-wizardry.com";
     target="iphoneos";

# Checkout headers from GitHub
mkdir Headers;
git checkout EWCacheManager/master \
             EWCacheManager/EWCacheManager.h \
       && mv EWCacheManager/EWCacheManager.h \
             Headers \
   && rm -rf EWCacheManager/;

git checkout UIColor-ColorWithHex/master \
             UIColor+ColorWithHex.h \
       && mv UIColor+ColorWithHex.h \
             Headers;


# Run appledoc and clean up after
/usr/local/bin/appledoc \
       --project-company         "${company}" \
       --project-name            "${projectName}" \
       --company-id              "${companyID}" \
       --output                  "." \
       --docset-platform-family  "${target}" \
       --docset-bundle-id        "${bundleID}" \
       --docset-bundle-name      "${bundleName}" \
       --docset-package-filename "${bundleName}" \
       --install-docset \
       --logformat xcode \
       --keep-intermediate-files \
       --no-repeat-first-par \
       --no-warn-invalid-crossref \
       --exit-threshold 2 \
       "Headers" && \
rm -rf docset/ \
       docset-installed.txt && \
rm -rf Categories/ Classes/ css/ img/ && \
    mv html/* .;
rm -rf Headers/ \
       EWCacheManager/;