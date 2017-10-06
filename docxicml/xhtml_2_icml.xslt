<?xml version="1.0" encoding="UTF-8"?>
<!-- xsl stylesheet declaration with xsl namespace:
Namespace tells the xlst processor about which
element is to be processed and which is used for output purpose only
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="https://github.com/GitBruno/docxicml"> 
<xsl:output method="xml" indent="yes"/>

<xsl:variable name='styleNames' select='document("")/xsl:stylesheet/s:styles/s:style'/> 

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

<Document DOMVersion="8.0" Self="docxcavate">
<!-- START PARAGRAPH STYLE DEFINITION -->

  <RootParagraphStyleGroup Self="docxcavate_paragraph_styles">

    <ParagraphStyle Self="ParagraphStyle/$ID/[No paragraph style]" Name="$ID/[No paragraph style]" />

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
                                          //samp[@class]/@class     |
                                          //table[@class]/@class    )">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="."/></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:if test="//h1[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='h1']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h2[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='h2']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h3[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='h3']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h4[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='h4']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h5[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='h5']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//h6[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='h6']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//p[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='p']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//center[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='center']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//ul[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='ul']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//ol[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='ol']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//pre[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='pre']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//q[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='q']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//samp[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='samp']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//time[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='time']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//table[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='table']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </RootParagraphStyleGroup>

<!-- END PARAGRAPH STYLE DEFINITION -->


<!--START CHARACTER STYLE DEFINITION-->

  <RootCharacterStyleGroup Self="docxcavate_character_styles">

    <CharacterStyle Self="CharacterStyle/$ID/[No character style]" Name="$ID/[No character style]" />

    <xsl:if test="//b[not(@class)] | //strong[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='b']/@name"/></xsl:with-param>
        <xsl:with-param name="fontStyle">Bold</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//s[not(@class)] | //strike[not(@class)] | //del[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='s']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//i[not(@class)] | //em[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='i']/@name"/></xsl:with-param>
        <xsl:with-param name="fontStyle">Italic</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//a[not(@class)] | //link[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='a']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//small[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='small']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//sub[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='sub']/@name"/></xsl:with-param>
        <xsl:with-param name="position">Subscript</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//sup[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='sup']/@name"/></xsl:with-param>
        <xsl:with-param name="position">Superscript</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//tt[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='tt']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//u[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='u']/@name"/></xsl:with-param>
        <xsl:with-param name="underline">true</xsl:with-param>
        <xsl:with-param name="underlineOffset">2</xsl:with-param>
        <xsl:with-param name="underlineWeight">0.75</xsl:with-param>
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

  <RootTableStyleGroup Self="docxcavate_table_styles">
    <TableStyle Self="TableStyle/Table" Name="Table" />
  </RootTableStyleGroup>
  <RootCellStyleGroup Self="docxcavate_cell_styles">
    <CellStyle Self="CellStyle/Cell" AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]" Name="Cell" />
  </RootCellStyleGroup>

  <Story Self="docxcavate_story" TrackChanges="false" StoryTitle="" AppliedTOCStyle="n" AppliedNamedGrid="n" >
    <StoryPreference OpticalMarginAlignment="true" OpticalMarginSize="12" />
    <xsl:apply-templates />
  </Story>

</Document>

</xsl:template>


<!-- S T A R T   T E M P L A T E S -->

<!-- P R O C E S S   P A R A G R A P H   S T Y L E S -->

<xsl:template name="createParagraphStyle">
  <xsl:param name="styleName" />
  <ParagraphStyle>
    <xsl:attribute name="Self">ParagraphStyle/<xsl:value-of select="$styleName"/></xsl:attribute>
    <!--
    <xsl:attribute name="Name"><xsl:value-of select="$styleName"/></xsl:attribute>
    -->
    <xsl:attribute name="Name"><xsl:value-of select="$styleName"/></xsl:attribute>
    <Properties>
      <BasedOn type="object">$ID/[No paragraph style]</BasedOn>
    </Properties>
  </ParagraphStyle>
</xsl:template>

<xsl:template name="normalizeCharacterStyles">
  <!-- InDesign needs everything styled, 
       render any unstyled characters in [No character style] -->
  <xsl:for-each select="node()">
    <xsl:choose>
      <xsl:when test="self::text()">
        <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]">
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
    <Br />
  </ParagraphStyleRange>
</xsl:template>

<!-- paragraphs with class -->
<xsl:template match="//h1[@class] | //h2[@class] | //h3[@class] | //h4[@class] | //h5[@class] | //h6[@class] | //p[@class] | //center[@class] | //ul[@class] | //ol[@class] | //pre[@class] | //q[@class] | //samp[@class] | //table[@class]" >
  <xsl:call-template name="paragraphStyleRange" >
    <xsl:with-param name="styleName"><xsl:value-of select="@class" /></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- paragarphs without class -->
<xsl:template match="//h1[not(@class)] | //h2[not(@class)] | //h3[not(@class)] | //h4[not(@class)] | //h5[not(@class)] | //h6[not(@class)] | //p[not(@class)] | //center[not(@class)] | //ul[not(@class)] | //ol[not(@class)] | //pre[not(@class)] | //q[not(@class)]" >
  <xsl:call-template name="paragraphStyleRange">
    <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag=local-name()]/@name" /></xsl:with-param> 
  </xsl:call-template>
</xsl:template>

<!-- list items -->
<xsl:template match="//ol/li">
  <xsl:call-template name="paragraphStyleRange">
    <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='ol']/@name"/></xsl:with-param> 
  </xsl:call-template>
</xsl:template>

<xsl:template match="//ul/li">
  <xsl:call-template name="paragraphStyleRange">
    <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='ul']/@name"/></xsl:with-param>
  </xsl:call-template>
</xsl:template> 

<!-- Page and Column Breaks -->
<xsl:template match="//br[@class='column']">
  <ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]" ParagraphBreakType="NextColumn">
    <Br />
  </ParagraphStyleRange>
</xsl:template>
<xsl:template match="//br[@class='page']">
  <ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]" ParagraphBreakType="NextPage">
    <Br />
  </ParagraphStyleRange>
</xsl:template>


<!-- P R O C E S S  C H A R A C T E R   S T Y L E S -->

<xsl:template name="createCharacterStyle">
  <xsl:param name="styleName" />
  <xsl:param name="fontStyle" />
  <xsl:param name="position" />
  <xsl:param name="underline" />
  <xsl:param name="underlineOffset" />
  <xsl:param name="underlineWeight" />
  <CharacterStyle>
    <xsl:attribute name="Self">CharacterStyle/<xsl:value-of select="$styleName"/></xsl:attribute>
    <xsl:attribute name="Name"><xsl:value-of select="$styleName"/></xsl:attribute>
    <xsl:if test="string($fontStyle)">
      <xsl:attribute name="FontStyle"><xsl:value-of select="$fontStyle"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="string($position)">
      <xsl:attribute name="Position"><xsl:value-of select="$position"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="string($underline)">
      <xsl:attribute name="Underline"><xsl:value-of select="$underline"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="string($underlineOffset)">
      <xsl:attribute name="UnderlineOffset"><xsl:value-of select="$underlineOffset"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="string($underlineWeight)">
      <xsl:attribute name="UnderlineWeight"><xsl:value-of select="$underlineWeight"/></xsl:attribute>
    </xsl:if>
    <Properties>
      <BasedOn type="object">$ID/[No character style]</BasedOn>
    </Properties>
  </CharacterStyle>
</xsl:template>

<!-- Style class (ignore span without class) -->
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
  <CharacterStyleRange>  
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='i']/@name"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- bold -->
<xsl:template match="//strong[not(@class)] | //b[not(@class)]">
  <CharacterStyleRange>  
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='b']/@name"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- strikethrough -->
<xsl:template match="//strike[not(@class)] | //s[not(@class)] | //del[not(@class)]">
  <CharacterStyleRange>
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='strike']/@name"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- Subscripted text -->
<xsl:template match="//sub[not(@class)]">
  <CharacterStyleRange>
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='sub']/@name"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- superscripted text -->
<xsl:template match="//sup[not(@class)]">
  <CharacterStyleRange>
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='sup']/@name"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- time -->
<xsl:template match="//time[not(@class)]">
  <CharacterStyleRange>
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='time']/@name"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- teletype -->
<xsl:template match="//tt[not(@class)]">
  <CharacterStyleRange>
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='tt']/@name"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- underline -->
<xsl:template match="//u[not(@class)]">
  <CharacterStyleRange>
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='u']/@name"/></xsl:attribute>
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<!-- links -->
<xsl:template match="//a[not(@class)] | //link[not(@class)]">
  <CharacterStyleRange> 
    <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleNames[@tag='a']/@name"/></xsl:attribute>
    <!-- to implement actual links
    be wary of <base tag> Specifies the base URL/target for all relative URLs in a document
    <HyperlinkTextSource Self="{@href}" Name="{@href}" Hidden="false" AppliedCharacterStyle="CharacterStyle/Hyperlink">
      <Content><xsl:apply-templates select="text()"/></Content>
    </HyperlinkTextSource> -->
    <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<xsl:template name="define_table_columns">
  <xsl:param name="index">0</xsl:param>
  <xsl:param name="columnCount">1</xsl:param>
  <xsl:if test="not($index &gt; $columnCount)">
    <Column Name="{$index}" />
    <xsl:call-template name="define_table_columns">
      <xsl:with-param name="index">
        <xsl:value-of select="$index + 1" />
      </xsl:with-param>
      <xsl:with-param name="columnCount">
        <xsl:value-of select="$columnCount" />
      </xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template match="//table">

  <xsl:variable name="headerRowCount">
    <xsl:choose>
      <xsl:when test="child::thead">
        <xsl:value-of select="count(child::thead/tr)"/>
      </xsl:when>
      <xsl:when test="child::tr[th]">
        <xsl:value-of select="count(child::tr[th])"/>
      </xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:variable name="bodyRowCount">
    <xsl:choose>
      <xsl:when test="child::tbody">
        <xsl:value-of select="count(child::tbody/tr)"/>
      </xsl:when>
      <xsl:when test="child::tr">
        <xsl:value-of select="count(child::tr)"/> 
      </xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="footerRowCount">
    <xsl:choose>
      <xsl:when test="child::tfoot">
        <xsl:value-of select="count(child::tfoot/tr)"/>
      </xsl:when><xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="columnCount">
    <xsl:choose>
      <xsl:when test="child::tbody">
        <xsl:value-of select="max(child::tbody/tr/count(td))"/>
      </xsl:when>
      <xsl:when test="child::tr">
        <xsl:value-of select="max(child::tr/count(td))"/>
      </xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>


  <ParagraphStyleRange>
  <xsl:attribute name="AppliedParagraphStyle">ParagraphStyle/<xsl:value-of select="$styleNames[@tag='table']/@name"/></xsl:attribute>
    <CharacterStyleRange>
      <Table HeaderRowCount="{$headerRowCount}" BodyRowCount="{$bodyRowCount}" FooterRowCount="{$footerRowCount}" ColumnCount="{$columnCount}" AppliedTableStyle="TableStyle/Table" TableDirection="LeftToRightDirection">
        <!-- define rows -->
        <xsl:for-each select="child::thead/tr | child::tbody/tr | child::tr | child::tfooter/tr">
          <xsl:variable name="rowNumber" select="position() - 1"/>
          <Row Name="{$rowNumber}" />
        </xsl:for-each>
        <!-- define columns -->
        <xsl:call-template name="define_table_columns">
          <xsl:with-param name="index">
            <xsl:value-of select="0" />
          </xsl:with-param>
          <xsl:with-param name="columnCount">
            <xsl:value-of select="$columnCount - 1" />
          </xsl:with-param>
        </xsl:call-template>
        <!-- Now we can define cells, ICML is wierd! -->
        <xsl:for-each select="child::thead/tr | child::tbody/tr | child::tr | child::tfooter/tr">
          <xsl:variable name="rowNumber" select="position() - 1" />
          <xsl:for-each select="child::td | child::th">
            <xsl:variable name="colNumber" select="position() - 1" />
            
            <xsl:variable name="colSpan">
              <xsl:choose>
                <xsl:when test="@colspan"><xsl:value-of select="@colspan" /></xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>

            <xsl:variable name="rowSpan">
              <xsl:choose>
                <xsl:when test="@rowspan"><xsl:value-of select="@rowspan" /></xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>

            <Cell Name="{$colNumber}:{$rowNumber}" RowSpan="{$rowSpan}" ColumnSpan="{$colSpan}" AppliedCellStyle="CellStyle/$ID/[None]" AppliedCellStylePriority="0">
              <xsl:apply-templates />
            </Cell>

          </xsl:for-each>
        </xsl:for-each>
      </Table>
      <Br />
    </CharacterStyleRange>
  </ParagraphStyleRange>
</xsl:template>

<!-- just added these for completion so if there is any text in these elemenst they will be processed -->
<xsl:template match="//abbr | //acronym | //address | //article | //aside | //bdi | //bdo | //big | //blockquote | //caption | 
                     //cite | //code | //col | //colgroup | //datalist | //dd | //details | //div | //dl | //dt | //fieldset | 
                     //frameset | //iframe | //input | //ins | //kbd | //label | //legend | //main | //mark | //section | //var">
  <CharacterStyleRange>
      <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>

<xsl:template match="body">
  <xsl:apply-templates select="*"/>
</xsl:template>

<s:styles>
  <!-- Paragraph Styles -->
  <s:style tag="h1"     name="Header 1"/>
  <s:style tag="h2"     name="Header 2"/>
  <s:style tag="h3"     name="Header 3"/>
  <s:style tag="h4"     name="Header 4"/>
  <s:style tag="h5"     name="Header 5"/>
  <s:style tag="h6"     name="Header 6"/>
  <s:style tag="p"      name="Paragraph"/>
  <s:style tag="center" name="Center"/>
  <s:style tag="ul"     name="Unordered List"/>
  <s:style tag="ol"     name="Ordered List"/>
  <s:style tag="pre"    name="Pre Formatted"/>
  <s:style tag="q"      name="Quotation"/>
  <s:style tag="samp"   name="Sample Output"/>
  <s:style tag="table"  name="Table"/>
  <!-- Character Styles -->
  <s:style tag="span"   name="Span"/>
  <s:style tag="b"      name="Bold"/>
  <s:style tag="strong" name="Bold"/>
  <s:style tag="s"      name="Strikethrough"/>
  <s:style tag="strike" name="Strikethrough"/>
  <s:style tag="del"    name="Strikethrough"/>
  <s:style tag="i"      name="Italic"/>
  <s:style tag="em"     name="Italic"/>
  <s:style tag="link"   name="Hyperlink"/>
  <s:style tag="a"      name="Hyperlink"/>
  <s:style tag="small"  name="Small Print"/>
  <s:style tag="sub"    name="Subscript"/>
  <s:style tag="sup"    name="Superscript"/>
  <s:style tag="time"   name="Time"/>
  <s:style tag="tt"     name="Teletype"/>
  <s:style tag="u"      name="Underline"/>
</s:styles>

</xsl:stylesheet>
