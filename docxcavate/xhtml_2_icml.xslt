<?xml version="1.0" encoding="UTF-8"?>
<!-- xsl stylesheet declaration with xsl namespace:
Namespace tells the xlst processor about which
element is to be processed and which is used for output purpose only
-->
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
  <xsl:output method="xml" indent="yes"/>
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

    <xsl:if test="//s[not(@class)] | //strike[not(@class)] | //del[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">Strikethrough</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//i[not(@class)] | //em[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">Italic</xsl:with-param>
        <xsl:with-param name="fontStyle">Italic</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//a[not(@class)] | //link[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">Hyperlink</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//small[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">small</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//sub[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">sub</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//tt[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">teletype</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//u[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">underline</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:for-each select="distinct-values(//span[@class]/@class   |
                                          //b[@class]/@class      |
                                          //strong[@class]/@class |
                                          //s[@class]/@class      |
                                          //strike[@class]/@class |
                                          //del[@class]/@class    |
                                          //i[@class]/@class      |
                                          //em[@class]/@class     |
                                          //link[@class]/@class   |
                                          //a[@class]/@class      |
                                          //small[@class]/@class  |
                                          //sub[@class]/@class    |
                                          //time[@class]/@class   |
                                          //tt[@class]/@class     |
                                          //u[@class]/@class      )">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="." /></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

  </RootCharacterStyleGroup>

<!-- END CHARACTER STYLE DEFINITION -->

<!-- START PARAGRAPH STYLE DEFINITION -->

  <RootParagraphStyleGroup Self="keep-style-refs_paragraph_styles">
    <ParagraphStyle Self="$ID/NormalParagraphStyle" Name="$ID/NormalParagraphStyle" />

    <xsl:for-each select="distinct-values(//h1[@class]/@class       | 
                                          //h2[@class]/@class       | 
                                          //h3[@class]/@class       | 
                                          //h4[@class]/@class       | 
                                          //h5[@class]/@class       | 
                                          //h6[@class]/@class       | 
                                          //p[@class]/@class        |
                                          //center[@class]/@class   |
                                          //ul[@class]/@class       |
                                          //ol[@class]/@class       |
                                          //pre[@class]/@class      |
                                          //q[@class]/@class        |
                                          //samp[@class]/@class     )">
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

    <xsl:if test="//p[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">p</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//center[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">center</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//ul[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">ul</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//ol[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">ol</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//pre[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">pre</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//q[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">q</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//samp[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">samp</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//time[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">time</xsl:with-param>
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

<!-- start body -->

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

<!-- char style classes (ignore span without class) -->
<xsl:template match="//span[@class]   | 
                     //b[@class]      | 
                     //strong[@class] | 
                     //s[@class]      | 
                     //strike[@class] | 
                     //del[@class]    | 
                     //i[@class]      | 
                     //em[@class]     | 
                     //link[@class]   | 
                     //a[@class]      | 
                     //small[@class]  |
                     //sub[@class]    |
                     //time[@class]   |
                     //tt[@class]     |
                     //u[@class]     ">
  <CharacterStyleRange>
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="@class"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- italics -->
<xsl:template match="//em[not(@class)] | //i[not(@class)]">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/Italic">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- bold -->
<xsl:template match="//strong[not(@class)] | //b[not(@class)]">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/Bold">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- strikethrough -->
<xsl:template match="//strike[not(@class)] | //s[not(@class)] | //del[not(@class)]">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/Strikethrough">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- superscripted text -->
<xsl:template match="//sub[not(@class)]">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/sub">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- time -->
<xsl:template match="//time[not(@class)]">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/time">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- teletype -->
<xsl:template match="//tt[not(@class)]">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/teletype">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- underline -->
<xsl:template match="//u[not(@class)]">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/underline">
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>


<xsl:template match="//a[not(@class)] | //link[not(@class)]">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/Hyperlink"> 
    <!-- to implement actual links
    be wary of <base tag> Specifies the base URL/target for all relative URLs in a document
    <HyperlinkTextSource Self="{@href}" Name="{@href}" Hidden="false" AppliedCharacterStyle="CharacterStyle/Hyperlink">
      <Content><xsl:apply-templates select="text()"/></Content>
    </HyperlinkTextSource> -->
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>   

<!-- list items -->
<xsl:template match="//ol/li">
  <xsl:call-template name="paragraphStyleRange">
    <xsl:with-param name="styleName">ol</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="//ul/li">
  <xsl:call-template name="paragraphStyleRange">
    <xsl:with-param name="styleName">ul</xsl:with-param>
  </xsl:call-template>
</xsl:template> 

<!-- just added these for completion so if there is any text in these elemenst they will be processed -->
<xsl:template match="//abbr | //acronym | //address | //article | //aside | //bdi | //bdo | //big | //blockquote | //caption | 
                    //cite | //code | //col | //colgroup | //datalist | //dd | //details | //div | //dl | //dt | //fieldset | 
                    //frameset | //iframe | //input | //ins | //kbd | //label | //legend | //main | //mark | //section | //var">
  <CharacterStyleRange>
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

<xsl:template name="paragraphStyleRange">
  <xsl:param name="styleName" />
  <ParagraphStyleRange>
    <xsl:attribute name="AppliedParagraphStyle">ParagraphStyle/<xsl:value-of select="$styleName" /></xsl:attribute> 
    <xsl:call-template name="normalizeCharacterStyles" />
  </ParagraphStyleRange>
  <Br />
</xsl:template>

<!-- paragarphs with class -->
<xsl:template match="//h1[@class] | //h2[@class] | //h3[@class] | //h4[@class] | //h5[@class] | //h6[@class] | //p[@class] | //center[@class] | //ul[@class] | //ol[@class] | //pre[@class] | //q[@class] | //samp[@class]" >
  <xsl:call-template name="paragraphStyleRange" >
    <xsl:with-param name="styleName"><xsl:value-of select="@class" /></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- paragarphs without class -->
<xsl:template match="//h1[not(@class)] | //h2[not(@class)] | //h3[not(@class)] | //h4[not(@class)] | //h5[not(@class)] | //h6[not(@class)] | //p[not(@class)] | //center[not(@class)] | //ul[not(@class)] | //ol[not(@class)] | //pre[not(@class)] | //q[not(@class)] | //samp[not(@class)]" >
  <xsl:call-template name="paragraphStyleRange">
    <xsl:with-param name="styleName"><xsl:value-of select="local-name()" /></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- END PROCESS STYLES -->

<!-- TO DO: deal with tables, table/tbody/tr/td/tfoot/th/thead -->

<xsl:template match="body">
  <xsl:apply-templates select="*"/>
</xsl:template>

</xsl:stylesheet>
