<?xml version="1.0" encoding="UTF-8"?>
<!-- xsl stylesheet declaration with xsl namespace:
Namespace tells the xlst processor about which
element is to be processed and which is used for output purpose only
-->
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
  <xsl:output indent="yes"/>
<!--Conversion of 'XHTML' documents to Adobe InCopy ICML, a stand-alone XML format
which is a subset of the zipped IDML format for which the documentation is
available here: http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/devnet/indesign/sdk/cs6/idml/idml-specification.pdf
InCopy is the companion word-processor to Adobe InDesign and ICML documents can be integrated
into InDesign with File -> Place.-->
<!--<?xml version="1.0" encoding="UTF-8" standalone="yes"?>-->
  <xsl:output method="xml" version="1.0" encoding="UTF-8" standalone="yes"/>
  <xsl:preserve-space elements="body"/>
<!-- xsl template declaration: 
template tells the xlst processor about the section of xml 
document which is to be formatted. It takes an XPath expression.
In our case, it is matching document root element and will 
tell processor to process the entire document with this template.
-->
<xsl:template match="/">
<!--
<?aid style="50" type="snippet" readerVersion="7.0" featureSet="513" product="7.0(292)" ?>
<?aid SnippetType="InCopyInterchange"?>
-->
<xsl:processing-instruction name="aid">style="50" type="snippet" readerVersion="6.0" featureSet="513" product="8.0(370)"</xsl:processing-instruction>
<xsl:processing-instruction name="aid">SnippetType="InCopyInterchange"</xsl:processing-instruction>

<Document DOMVersion="8.0" Self="keep-style-refs">
  
<!--START CHARACTER STYLE DEFINITION-->

  <RootCharacterStyleGroup Self="keep-style-refs_character_styles">
    <CharacterStyle Self="$ID/NormalCharacterStyle" Name="Default" />

    <xsl:if test="//b[not(@class)] | //strong[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">Bold</xsl:with-param>
        <xsl:with-param name="fontStyle">Bold</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//i[not(@class)] | //em[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">Italic</xsl:with-param>
        <xsl:with-param name="fontStyle">Italic</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:for-each select="distinct-values(//span[@class]/@class)">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="." /></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

  </RootCharacterStyleGroup>

<!-- END CHARACTER STYLE DEFINITION -->

<!-- START PARAGRAPH STYLE DEFINITION -->

  <RootParagraphStyleGroup Self="keep-style-refs_paragraph_styles">
    <ParagraphStyle Self="$ID/NormalParagraphStyle" Name="$ID/NormalParagraphStyle" />

    <xsl:for-each select="distinct-values(//h1[@class]/@class | //h2[@class]/@class | //h3[@class]/@class | //h4[@class]/@class | //h5[@class]/@class | //h6[@class]/@class | //p[@class]/@class )">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="."/></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:if test="//h1[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">h1</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h2[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">h2</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h3[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">h3</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h4[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">h4</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h5[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">h5</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h6[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">h6</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

  </RootParagraphStyleGroup>

<!-- END PARAGRAPH STYLE DEFINITION -->

  <RootTableStyleGroup Self="keep-style-refs_table_styles">
    <TableStyle Self="TableStyle/Table" Name="Table" />
  </RootTableStyleGroup>
  <RootCellStyleGroup Self="keep-style-refs_cell_styles">
    <CellStyle Self="CellStyle/Cell" AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]" Name="Cell" />
  </RootCellStyleGroup>
  <Story Self="keep-style-refs_story" TrackChanges="false" StoryTitle="" AppliedTOCStyle="n" AppliedNamedGrid="n" >
    <StoryPreference OpticalMarginAlignment="true" OpticalMarginSize="12" />

    <xsl:apply-templates />

  </Story>
</Document>

</xsl:template>

<!-- start templates -->

<xsl:template name="createCharacterStyle">
  <xsl:param name="styleName" />
  <xsl:param name="fontStyle" />
  <CharacterStyle>
    <xsl:attribute name="Self">CharacterStyle/<xsl:value-of select="$styleName"/></xsl:attribute>
    <xsl:attribute name="Name"><xsl:value-of select="$styleName"/></xsl:attribute>
    <xsl:choose>
        <xsl:when test="string($fontStyle)">
            <xsl:attribute name="FontStyle"><xsl:value-of select="$fontStyle"/></xsl:attribute>
        </xsl:when>
    </xsl:choose>
    <Properties>
      <BasedOn type="object">$ID/NormalCharacterStyle</BasedOn>
    </Properties>
  </CharacterStyle>
</xsl:template>

<xsl:template name="createParagraphStyle">
  <xsl:param name="styleName" />
  <ParagraphStyle>
    <xsl:attribute name="Self">ParagraphStyle/<xsl:value-of select="$styleName"/></xsl:attribute>
    <xsl:attribute name="Name"><xsl:value-of select="$styleName"/></xsl:attribute>
    <Properties>
      <BasedOn type="object">$ID/NormalParagraphStyle</BasedOn>
    </Properties>
  </ParagraphStyle>
</xsl:template>


<!-- P R O C E S S  C H A R A C T E R   S T Y L E S -->

<!-- span with class (ignore span without class) -->
<xsl:template match="//span[@class]">
  <CharacterStyleRange>
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="@class"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- italics -->
<xsl:template match="//em | //i">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/Italic">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- bold -->
<xsl:template match="//strong | //b">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/Bold">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>


<!-- P R O C E S S   P A R A G R A P H   S T Y L E S -->

<xsl:template name="normalizeCharacterStyles">
  <!-- wrap any unstyled chars in normal char style -->
  <xsl:for-each select="node()">
    <xsl:choose>
      <xsl:when test="self::text()">
        <CharacterStyleRange AppliedParagraphStyle="$ID/NormalCharacterStyle">
          <Content><xsl:value-of select="current()"/></Content>
        </CharacterStyleRange>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="current()" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

<!-- paragarphs with class -->
<xsl:template match="//h1[@class] | //h2[@class] | //h3[@class] | //h4[@class] | //h5[@class] | //h6[@class] | //p[@class]" >
  <ParagraphStyleRange>
    <xsl:attribute name="AppliedParagraphStyle">ParagraphStyle/<xsl:value-of select="@class"/></xsl:attribute>    
    <xsl:call-template name="normalizeCharacterStyles" />
  </ParagraphStyleRange>
  <Br />
</xsl:template>

<!-- paragarphs without class -->
<xsl:template match="//h1[not(@class)] | //h2[not(@class)] | //h3[not(@class)] | //h4[not(@class)] | //h5[not(@class)] | //h6[not(@class)] | //p[not(@class)]" >
  <ParagraphStyleRange>
    <xsl:attribute name="AppliedParagraphStyle">ParagraphStyle/<xsl:value-of select="local-name()"/></xsl:attribute>    
    <xsl:call-template name="normalizeCharacterStyles" />
  </ParagraphStyleRange>
  <Br />
</xsl:template>


<xsl:template match="body">
  <xsl:apply-templates select="*"/>
</xsl:template>

</xsl:stylesheet>
