<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head><title>Releve</title></head>
            <body>
                <h1> Liste des opérations CREDIT de releve</h1>
                <ul>
                    <li>RIB: <xsl:value-of select="releve/@RIB"/></li>
                    <li>Date releve: <xsl:value-of select="releve/dateReleve"/></li>
                    <li>Solde: <xsl:value-of select="releve/solde"/></li>
                    <li>Période: du <xsl:value-of select="releve/operations/@dateDebut"/> au <xsl:value-of select="releve/operations/@dateFin"/></li>
                </ul>
                <table border="1" width="90%">
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>