<?xml version="1.0" encoding="UTF-8"?>
<!-- saxon -o:output.xml -s:source.html thisStyleSheet.xslt -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8" />
    <xsl:preserve-space elements="body"/>

    <xsl:template match="/">
    <Content>

    <xsl:for-each select="//p[@class='05 Head C']">
      <xsl:call-template name="generateElement" />
    </xsl:for-each>

    </Content>
    </xsl:template>

    <xsl:template name="generateElement">
      <Container>
        <entry>
          <xsl:copy-of select="node()"/>
        </entry>
        <xsl:copy-of select="following-sibling::node()[1]"/>
      </Container>
    </xsl:template>
</xsl:stylesheet>