<?xml version="1.0" encoding="UTF-8"?>
<!-- xsl stylesheet declaration with xsl namespace:
Namespace tells the xlst processor about which
element is to be processed and which is used for output purpose only
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://styles.data"> 
<xsl:output method="xml" indent="yes"/>
<xsl:key name="styleLookup" match="s:styles" use="s:tag"/>
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

<xsl:variable name="stylename-lookup" select="document('')/*/s:styles"/>

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

    <xsl:if test="//table[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName">table</xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </RootParagraphStyleGroup>

<!-- END PARAGRAPH STYLE DEFINITION -->


<!--START CHARACTER STYLE DEFINITION-->

  <RootCharacterStyleGroup Self="docxcavate_character_styles">

    <CharacterStyle Self="CharacterStyle/$ID/[No character style]" Name="$ID/[No character style]" />

    <xsl:if test="//b[not(@class)] | //strong[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">b</xsl:with-param>
        <xsl:with-param name="fontStyle">Bold</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//s[not(@class)] | //strike[not(@class)] | //del[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">s</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//i[not(@class)] | //em[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">i</xsl:with-param>
        <xsl:with-param name="fontStyle">Italic</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//a[not(@class)] | //link[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">a</xsl:with-param>
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

    <xsl:if test="//sup[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">sup</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//tt[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">tt</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//u[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName">u</xsl:with-param>
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
    <xsl:with-param name="styleName"><xsl:value-of select="local-name()" /></xsl:with-param>
  </xsl:call-template>
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


<!-- P R O C E S S  C H A R A C T E R   S T Y L E S -->

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

<!-- Page and Column Breaks -->
<xsl:template match="//br[@class='column']">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]" ParagraphBreakType="NextColumn">
    <Br />
  </CharacterStyleRange>
</xsl:template>
<xsl:template match="//br[@class='page']">
  <CharacterStyleRange AppliedCharacterStyle="CharacterStyle/$ID/[No character style]" ParagraphBreakType="NextPage">
    <Br />
  </CharacterStyleRange>
</xsl:template>

<!-- links -->
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

<!-- tables, todo: table/tbody/tr/td/tfoot/th/thead -->

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

  <!-- Test
  <xsl:variable name="rowCount" select="$headerRowCount + $bodyRowCount + $footerRowCount"/>
  -->

  <ParagraphStyleRange AppliedParagraphStyle="ParagraphStyle/table">
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
  <s:style><s:tag>h1</s:tag><s:name>Header 1</s:name></s:style>
  <s:style><s:tag>h2</s:tag><s:name>Header 2</s:name></s:style>
  <s:style><s:tag>h3</s:tag><s:name>Header 3</s:name></s:style>
  <s:style><s:tag>h4</s:tag><s:name>Header 4</s:name></s:style>
  <s:style><s:tag>h5</s:tag><s:name>Header 5</s:name></s:style>
  <s:style><s:tag>h6</s:tag><s:name>Header 6</s:name></s:style>
  <s:style><s:tag>p</s:tag><s:name>Header 6</s:name></s:style>
  <s:style><s:tag>center</s:tag><s:name>Center</s:name></s:style>
  <s:style><s:tag>ul</s:tag><s:name>Unordered List</s:name></s:style>
  <s:style><s:tag>ol</s:tag><s:name>Ordered List</s:name></s:style>
  <s:style><s:tag>pre</s:tag><s:name>Pre Formatted</s:name></s:style>
  <s:style><s:tag>q</s:tag><s:name>Quotation</s:name></s:style>
  <s:style><s:tag>samp</s:tag><s:name>Sample Output</s:name></s:style>
  <s:style><s:tag>table</s:tag><s:name>Table</s:name></s:style>
  <!-- Character Styles -->
  <s:style><s:tag>span</s:tag><s:name>Span</s:name></s:style>
  <s:style><s:tag>b</s:tag><s:name>Bold</s:name></s:style>
  <s:style><s:tag>strong</s:tag><s:name>Bold</s:name></s:style>
  <s:style><s:tag>s</s:tag><s:name>Strikethrough</s:name></s:style>
  <s:style><s:tag>strike</s:tag><s:name>Strikethrough</s:name></s:style>
  <s:style><s:tag>del</s:tag><s:name>Strikethrough</s:name></s:style>
  <s:style><s:tag>i</s:tag><s:name>Italic</s:name></s:style>
  <s:style><s:tag>em</s:tag><s:name>Italic</s:name></s:style>
  <s:style><s:tag>link</s:tag><s:name>Hyperlink</s:name></s:style>
  <s:style><s:tag>a</s:tag><s:name>Hyperlink</s:name></s:style>
  <s:style><s:tag>small</s:tag><s:name>Small Print</s:name></s:style>
  <s:style><s:tag>sub</s:tag><s:name>Subscript</s:name></s:style>
  <s:style><s:tag>sup</s:tag><s:name>Superscript</s:name></s:style>
  <s:style><s:tag>time</s:tag><s:name>Time</s:name></s:style>
  <s:style><s:tag>tt</s:tag><s:name>Teletype</s:name></s:style>
  <s:style><s:tag>u</s:tag><s:name>Underline</s:name></s:style>
</s:styles>

</xsl:stylesheet>
