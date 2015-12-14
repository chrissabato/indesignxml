<?xml version="1.0" encoding="utf-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
        <xsl:output method="xml" indent="yes" />

        <xsl:template match="@* | node()">
            <xsl:copy>
                <xsl:apply-templates select="@* | node()" />
            </xsl:copy>
        </xsl:template>

        <!-- Sort players by total points (tp) -->
        <!-- change stats/@tp to stats/@otherstat to sort by other stat -->
        <xsl:template match="/bbgame/team">
            <xsl:copy>
                <xsl:apply-templates select="node()|@*">
                    <xsl:sort select="stats/@tp" data-type="number" order="descending"/>
                </xsl:apply-templates>
            </xsl:copy>
        </xsl:template>


        <!-- convert code to image link -->
        <!-- Change C:/Users/csabato/Desktop/xml/ to the path to your images -->
        <xsl:template match="@code">
            <xsl:element name="image">
                <xsl:attribute name="href">
                    <xsl:value-of select="concat('file:///C:/Users/csabato/Desktop/xml/',.,'.jpg')" />
                </xsl:attribute>
            </xsl:element>
        </xsl:template>


        <!-- move attributes to nodes -->
        <xsl:template match="@*">
            <xsl:element name="{name()}">
                <xsl:value-of select="." />
            </xsl:element>
        </xsl:template>



    </xsl:stylesheet>
