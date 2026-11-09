<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head><title>Releve</title></head>
            <body>
                <h1> Liste des opérations releve</h1>
                    <ul>
                        <li>RIB: <xsl:value-of select="releve/@RIB"/></li>
                        <li>Date releve: <xsl:value-of select="releve/dateReleve"/></li>
                        <li>Solde: <xsl:value-of select="releve/solde"/></li>
                    </ul>
                <table border="1" width="90%">
                    <tr>
                        <th colspan="2">Date debut:</th>
                        <td colspan="2"><xsl:value-of select="releve/operations/@dateDebut"/></td>
                    </tr>
                    <tr>
                        <th colspan="2">Date fin:</th>
                        <td colspan="2"><xsl:value-of select="releve/operations/@dateFin"/></td>
                    </tr>
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="3">Total des opérations de débit:</td>
                        <td><xsl:value-of select="sum(//operation[@type='DEBIT']/@montant)"/></td>
                    </tr>
                    <tr>
                        <td colspan="3">Total des opérations de crédit:</td>
                        <td><xsl:value-of select="sum(//operation[@type='CREDIT']/@montant)"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>