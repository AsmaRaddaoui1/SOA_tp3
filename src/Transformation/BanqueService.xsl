<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
       <html>
        <head>
            <title>Liste des comptes</title>
        </head>
        <body>
            <h1>Liste des comptes</h1>
            <table border="1">
                <tr>
                    <th>Code</th>
                    <th>Solde</th>
                    <th>Date de création</th>
                </tr>
                <xsl:for-each select="//getComptes[substring(dateCreation, 1, 4) > '2000']">
                    <tr>
                        <td><xsl:value-of select="code" /></td>
                        <td><xsl:value-of select="solde" /></td>
                        <td><xsl:value-of select="dateCreation" /></td>
                    </tr>
                </xsl:for-each>
            </table>

            
            <h2>Comptes créés après 2000</h2>
            <table border="1">
                <tr>
                    <th>Code</th>
                    <th>Solde</th>
                    <th>Date de création</th>
                </tr>
                <xsl:for-each select="//getComptes[substring(dateCreation, 1, 4) <= '2000']">
                    <tr>
                        <td><xsl:value-of select="code" /></td>
                        <td><xsl:value-of select="solde" /></td>
                        <td><xsl:value-of select="dateCreation" /></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>
