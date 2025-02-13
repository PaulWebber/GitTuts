<?xml version="1.0" encoding="UTF-8"?>
<xslt:stylesheet xmlns:date="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" xmlns:xslt="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xf="http://www.ecrion.com/xf/1.0" xmlns:xc="http://www.ecrion.com/2008/xc" xmlns:xfd="http://www.ecrion.com/xfd/1.0" xmlns:svg="http://www.w3.org/2000/svg" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:ns1="http://energynavigator.com/xml/afe/form-data/2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" extension-element-prefixes="date str">
  <xslt:output indent="no" encoding="utf-8"/>
  <!--%cfg-common%-->
  <!--%cfg-local%-->
  <xsl:template match="/">
    <fo:root <!--%var-root-font%-->>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="First Letter Page" page-width="8.5in" page-height="11in">
          <fo:region-body region-name="xsl-region-body" margin="<!--%var-header-height%--> <!--%var-right-margin%--> 1in <!--%var-left-margin%-->"/>
          <fo:region-before region-name="xsl-region-before-first" extent="<!--%var-header-height%-->" />
          <fo:region-after region-name="xsl-region-after" extent="0.75in" display-align="center"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="Letter Page" page-width="8.5in" page-height="11in">
          <fo:region-body region-name="xsl-region-body" margin="<!--%var-header-height%--> <!--%var-right-margin%--> 1in <!--%var-left-margin%-->"/>
          <fo:region-before region-name="xsl-region-before" extent="<!--%var-header-height%-->" />
	  		  <fo:region-after region-name="xsl-region-after-first" extent="0.75in" display-align="center"/>

        </fo:simple-page-master> 
        <fo:page-sequence-master master-name="Document">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference blank-or-not-blank="not-blank" page-position="first" master-reference="First Letter Page"/>
            <fo:conditional-page-master-reference blank-or-not-blank="not-blank" page-position="rest" master-reference="Letter Page"/>
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="Document">
        <fo:static-content flow-name="xsl-region-after">
          <!--%var-footer%-->
        </fo:static-content>
		
		<fo:static-content flow-name="xsl-region-after-first">
          <!--%  var-footer-subsequent %-->
        </fo:static-content>
		
        <fo:static-content flow-name="xsl-region-before">
          <!--%  page-header-subsequent %-->
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-before-first">
          <!--%  page-header %-->
        </fo:static-content>
		
		
		
        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            <!--% body %-->
            <fo:inline id="end" />
          </fo:block>
        </fo:flow>
      </fo:page-sequence>

    </fo:root>
  </xsl:template>
  <!--%util%-->
</xslt:stylesheet>
