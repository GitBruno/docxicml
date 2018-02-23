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

<Document DOMVersion="8.0" Self="docxicml">
<!-- START PARAGRAPH STYLE DEFINITION -->

  <RootParagraphStyleGroup Self="docxicml_paragraph_styles">

    <ParagraphStyle Self="ParagraphStyle/$ID/[No paragraph style]" Name="$ID/[No paragraph style]" />

    <xsl:for-each select="distinct-values(//h1[@class]/@class       | 
                                          //h2[@class]/@class       | 
                                          //h3[@class]/@class       | 
                                          //h4[@class]/@class       | 
                                          //h5[@class]/@class       | 
                                          //h6[@class]/@class       | 
                                          //p[@class]/@class        |
                                          //center[@class]/@class   |
                                          //pre[@class]/@class      |
                                          //q[@class]/@class        |
                                          //samp[@class]/@class     |
                                          //table[@class]/@class    )">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="."/></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select="distinct-values(//ol[@class]/@class)">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="."/></xsl:with-param>
        <xsl:with-param name="bulletsAndNumberingListType">NumberedList</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select="distinct-values(//ul[@class]/@class)">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="."/></xsl:with-param>
        <xsl:with-param name="bulletsAndNumberingListType">BulletList</xsl:with-param>
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
        <xsl:with-param name="bulletsAndNumberingListType">BulletList</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//ol[not(@class)]">
      <xsl:call-template name="createParagraphStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='ol']/@name"/></xsl:with-param>
        <xsl:with-param name="bulletsAndNumberingListType">NumberedList</xsl:with-param>
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

  <RootCharacterStyleGroup Self="docxicml_character_styles">

    <CharacterStyle Self="CharacterStyle/$ID/[No character style]" Name="$ID/[No character style]" />

    <xsl:if test="//b[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='b']/@name"/></xsl:with-param>
        <!-- Most likely fine! -->
        <xsl:with-param name="fontStyle">Bold</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//strong[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='strong']/@name"/></xsl:with-param>
        <!-- Most likely fine! -->
        <xsl:with-param name="fontStyle">Bold</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//i[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='i']/@name"/></xsl:with-param>
        <!-- Most likely fine! -->
        <xsl:with-param name="fontStyle">Italic</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//em[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='em']/@name"/></xsl:with-param>
        <!-- Most likely fine! -->
        <xsl:with-param name="fontStyle">Italic</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//a[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='a']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    
    <xsl:if test="//link[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='link']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//s[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='s']/@name"/></xsl:with-param>
        <xsl:with-param name="strikeThrough">true</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//strike[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='strike']/@name"/></xsl:with-param>
        <xsl:with-param name="strikeThrough">true</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//del[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='del']/@name"/></xsl:with-param>
        <xsl:with-param name="strikeThrough">true</xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//small[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='small']/@name"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="//tt[not(@class)]">
      <xsl:call-template name="createCharacterStyle">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='tt']/@name"/></xsl:with-param>
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

    <!-- Create all needed styles -->
    <xsl:for-each select="//span   |
                          //b      |
                          //strong |
                          //s      |
                          //strike |
                          //del    |
                          //i      |
                          //em     |
                          //link   |
                          //a      |
                          //small  |
                          //sub    |
                          //time   |
                          //tt     |
                          //u      ">
      <xsl:variable name="elementName" select='local-name()' />
      <xsl:call-template name="createCharacterStyles">
        <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag=$elementName]/@name" /></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

  </RootCharacterStyleGroup>

<!-- END CHARACTER STYLE DEFINITION -->

  <RootObjectStyleGroup Self="docxicml_object_styles">
    <ObjectStyle Self="ObjectStyle/$ID/[None]" Name="$ID/[None]" />
  </RootObjectStyleGroup>

  <RootTableStyleGroup Self="docxicml_table_styles">
    <TableStyle Self="TableStyle/Table" Name="Table" />
  </RootTableStyleGroup>
  <RootCellStyleGroup Self="docxicml_cell_styles">
    <CellStyle Self="CellStyle/Cell" AppliedParagraphStyle="ParagraphStyle/$ID/[No paragraph style]" Name="Cell" />
  </RootCellStyleGroup>

  <Story Self="docxicml_story" TrackChanges="false" StoryTitle="" AppliedTOCStyle="n" AppliedNamedGrid="n" >
    <StoryPreference OpticalMarginAlignment="true" OpticalMarginSize="12" />
    <xsl:apply-templates />
  </Story>

</Document>

</xsl:template>

<!-- S T A R T   T E M P L A T E S -->

<xsl:template name="createParagraphStyle">
  <xsl:param name="styleName" />
  <xsl:param name="bulletsAndNumberingListType" />
  <xsl:param name="paragraphBreakType" />
  <ParagraphStyle>
    <xsl:attribute name="Self">ParagraphStyle/<xsl:value-of select="$styleName"/></xsl:attribute>
    <xsl:attribute name="Name"><xsl:value-of select="$styleName"/></xsl:attribute>
    <xsl:if test="string($bulletsAndNumberingListType)">
      <xsl:attribute name="BulletsAndNumberingListType"><xsl:value-of select="$bulletsAndNumberingListType"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="string($paragraphBreakType)">
      <xsl:attribute name="ParagraphBreakType"><xsl:value-of select="$paragraphBreakType"/></xsl:attribute>
    </xsl:if>
    <Properties>
      <BasedOn type="object">$ID/[No paragraph style]</BasedOn>
    </Properties>
  </ParagraphStyle>
</xsl:template>

<xsl:template name="createCharacterStyle">
  <xsl:param name="styleName" />
  <xsl:param name="fontStyle" />
  <xsl:param name="position" />
  <xsl:param name="underline" />
  <xsl:param name="underlineOffset" />
  <xsl:param name="underlineWeight" />
  <xsl:param name="strikeThrough" />
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
    <xsl:if test="string($strikeThrough)">
      <xsl:attribute name="StrikeThru"><xsl:value-of select="$strikeThrough"/></xsl:attribute>
    </xsl:if>
    <Properties>
      <BasedOn type="object">$ID/[No character style]</BasedOn>
    </Properties>
  </CharacterStyle>
</xsl:template>

<xsl:template name="createCharacterStyles">
  <xsl:param name="styleName" />
  <xsl:for-each select="node()">
    <xsl:variable name="elementName" select='local-name()' />
    <xsl:choose>
      <xsl:when test="self::text()">
        <xsl:call-template name="createCharacterStyle">
          <xsl:with-param name="styleName" select="$styleName"></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>      
        <xsl:choose>
          <xsl:when test="./@class">
            <xsl:call-template name="createCharacterStyles">
              <xsl:with-param name="styleName" select="concat($styleName, concat('_', ./@class))"></xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="createCharacterStyles">
              <xsl:with-param name="styleName" select="concat($styleName, concat('_', $styleNames[@tag=$elementName]/@name))"></xsl:with-param>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
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


<xsl:template name="characterStyleRange">
  <!-- We need to wrap each stylerange in node, and process any subnodes -->
  <xsl:param name="styleName" />
  <xsl:for-each select="node()">
    <xsl:choose>
      <xsl:when test="self::text()">
        <CharacterStyleRange>
        <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleName" /></xsl:attribute> 
          <Content><xsl:value-of select="current()"/></Content>
        </CharacterStyleRange>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="current()" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

<xsl:template name="characterStyleRanges">
  <xsl:param name="styleName" />
  <xsl:for-each select="node()">
    <xsl:variable name="elementName" select='./local-name()' />
    <xsl:choose>
      <xsl:when test="self::text()">
        <CharacterStyleRange>
        <xsl:attribute name="AppliedCharacterStyle">CharacterStyle/<xsl:value-of select="$styleName" /></xsl:attribute> 
          <Content><xsl:value-of select="current()"/></Content>
        </CharacterStyleRange>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="./@class">
            <xsl:call-template name="characterStyleRanges">
              <xsl:with-param name="styleName" select="concat($styleName, concat('_', ./@class))"></xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="characterStyleRanges">
              <xsl:with-param name="styleName" select="concat($styleName, concat('_', $styleNames[@tag=$elementName]/@name))"></xsl:with-param>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

<xsl:template name="paragraphStyleRange">
  <xsl:param name="styleName" />
  <xsl:param name="paragraphBreakType" />
  <ParagraphStyleRange>
    <xsl:attribute name="AppliedParagraphStyle">ParagraphStyle/<xsl:value-of select="$styleName" /></xsl:attribute>
    <xsl:if test="string($paragraphBreakType)">
      <xsl:attribute name="ParagraphBreakType"><xsl:value-of select="$paragraphBreakType" /></xsl:attribute> 
    </xsl:if>
    <xsl:call-template name="normalizeCharacterStyles" />
    <Br />
  </ParagraphStyleRange>
</xsl:template>

<xsl:template name="normalizeCharacterStyles">
  <!-- InDesign needs everything styled, 
       render any unstyled characters in [No character style] -->
  <xsl:call-template name="characterStyleRange">
    <xsl:with-param name="styleName">$ID/[No character style]</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- P R O C E S S   C H A R A C T E R    S T Y L E   T E M P L A T E S -->

<!-- Character Styles with class -->
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
    <xsl:call-template name="characterStyleRanges">
        <xsl:with-param name="styleName"><xsl:value-of select="@class"/></xsl:with-param>
    </xsl:call-template>
</xsl:template>

<!-- Character styles without class -->
<xsl:template match="//span[not(@class)]   |
                     //u[not(@class)]      |
                     //tt[not(@class)]     |
                     //time[not(@class)]   |
                     //sub[not(@class)]    |
                     //sup[not(@class)]    |
                     //strike[not(@class)] | 
                     //s[not(@class)]      | 
                     //del[not(@class)]    |
                     //strong[not(@class)] | 
                     //b[not(@class)]      |
                     //em[not(@class)]     | 
                     //i[not(@class)]      |
                     //a[not(@class)]      | 
                     //link[not(@class)]   ">
  <xsl:variable name="elementName" select='local-name()' />
  <xsl:call-template name="characterStyleRanges">
    <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag=$elementName]/@name"/></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- to implement actual links rather then style them
be wary of <base tag> Specifies the base URL/target for all relative URLs in a document
<HyperlinkTextSource Self="{@href}" Name="{@href}" Hidden="false" AppliedCharacterStyle="CharacterStyle/Hyperlink">
  <Content><xsl:apply-templates select="text()"/></Content>
</HyperlinkTextSource> -->

<!-- just added these for completion so if there is any text in these elemenst they will be processed -->
<xsl:template match="//abbr | //acronym | //address | //article | //aside | //bdi | //bdo | //big | //blockquote | //caption | 
                     //cite | //code | //col | //colgroup | //datalist | //dd | //details | //div | //dl | //dt | //fieldset | 
                     //frameset | //iframe | //input | //ins | //kbd | //label | //legend | //main | //mark | //section | //var">
  <CharacterStyleRange>
      <Content><xsl:apply-templates select="text()"/></Content>
  </CharacterStyleRange>
</xsl:template>


<!-- P R O C E S S   P A R A G R A P H   S T Y L E   T E M P L A T E S -->

<!-- paragraphs with class -->
<xsl:template match="//h1[@class] | //h2[@class] | //h3[@class] | //h4[@class] | //h5[@class] | //h6[@class] | //p[@class] | //center[@class] | //pre[@class] | //q[@class] | //samp[@class] | //table[@class]" >
  <xsl:call-template name="paragraphStyleRange" >
    <xsl:with-param name="styleName"><xsl:value-of select="@class" /></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- paragraphs without class -->
<xsl:template match="//h1[not(@class)] | //h2[not(@class)] | //h3[not(@class)] | //h4[not(@class)] | //h5[not(@class)] | //h6[not(@class)] | //p[not(@class)] | //center[not(@class)] | //pre[not(@class)] | //q[not(@class)]" >
  <xsl:variable name="elementName" select='local-name()' /> 
  <xsl:call-template name="paragraphStyleRange">
    <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag=$elementName]/@name" /></xsl:with-param> 
  </xsl:call-template>
</xsl:template>

<!-- list items -->
<xsl:template name="listItem">
  <xsl:param name="styleName" />
  <xsl:for-each select=".">
    <xsl:choose>
      <xsl:when test="self::li[not(@class)] or self::text() or self::p[not(@class)]">
        <xsl:call-template name="paragraphStyleRange">
            <xsl:with-param name="styleName"><xsl:value-of select="$styleName"/></xsl:with-param> 
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="self::br">
        <!-- ignore empty lines in lists -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="current()" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template> 

<xsl:template match="//ol/li[not(@class)]">
  <xsl:call-template name="listItem">
    <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='ol']/@name" /></xsl:with-param> 
  </xsl:call-template>
</xsl:template> 

<xsl:template match="//ul/li[not(@class)]">
  <xsl:call-template name="listItem">
    <xsl:with-param name="styleName"><xsl:value-of select="$styleNames[@tag='ul']/@name" /></xsl:with-param> 
  </xsl:call-template>
</xsl:template> 

<xsl:template match="//ol/li[@class] | //ul/li[@class]">
  <xsl:call-template name="listItem">
    <xsl:with-param name="styleName"><xsl:value-of select="@class" /></xsl:with-param> 
  </xsl:call-template>
</xsl:template>

<!-- Breaks -->
<xsl:template match="//br">
  <xsl:choose>
    <xsl:when test="contains(@class, column) or contains(@class, page)">
      <xsl:call-template name="paragraphStyleRange">
        <xsl:with-param name="styleName">$ID/[No paragraph style]</xsl:with-param>
        <xsl:with-param name="paragraphBreakType"><xsl:value-of select="@class"/></xsl:with-param> 
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="paragraphStyleRange">
        <xsl:with-param name="styleName">$ID/[No paragraph style]</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- P R O C E S S   T A B L E   T E M P L A T E S -->

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
</xsl:template> <!-- End table template -->


<!-- P R O C E S S   I M A G E S  +  T E M P L A T E S -->

<xsl:template name="image_embed_EMF">
  <xsl:param name="data" />
  <Rectangle ContentType="GraphicType" AppliedObjectStyle="ObjectStyle/$ID/[None]" >
    <Properties>
      <PathGeometry>
        <!-- Do we really need this? -->
        <GeometryPathType PathOpen="false">
          <PathPointArray>
            <PathPointType Anchor="0 0" LeftDirection="0 0" RightDirection="0 0" />
            <PathPointType Anchor="250 0" LeftDirection="250 0" RightDirection="250 0" />
            <PathPointType Anchor="250 125" LeftDirection="250 125" RightDirection="250 125" />
            <PathPointType Anchor="0 125" LeftDirection="0 125" RightDirection="0 125" />
          </PathPointArray>
        </GeometryPathType>
      </PathGeometry>
    </Properties>

    <WMF ImageTypeName="$ID/Windows Enhanced Meta Files" AppliedObjectStyle="ObjectStyle/$ID/[None]" >
      <Properties>
          <Contents>
            <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
            <xsl:copy-of select="replace($data, 'data:image/x-emf;base64,', '')"/>
            <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
          </Contents>
      </Properties>
      <Link LinkResourceFormat="$ID/Windows Enhanced Meta Files" StoredState="Embedded" />
    </WMF>

  </Rectangle>
</xsl:template>

<xsl:template match="//img">
  <xsl:variable name="source" select='@src' />
  <xsl:choose>
    <xsl:when test="starts-with($source,'data:image/x-emf;base64,')">
      <xsl:call-template name="image_embed_EMF">
        <xsl:with-param name="data" select="$source" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <!-- Image type not supported -->
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- E N D  O F  P R O C E S S I N G  T E M P L A T E S -->

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
