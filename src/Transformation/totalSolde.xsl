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
                    <xsl:variable name="totalSolde" select="sum(//getComptes/solde)" />
                    <xsl:for-each select="//getComptes[substring(dateCreation, 1, 4) > '2000']">
                        <tr>
                            <td><xsl:value-of select="code" /></td>
                            <td><xsl:value-of select="solde" /></td>
                            <td><xsl:value-of select="dateCreation" /></td>
                        </tr>
                    </xsl:for-each>
                </table>

              
                <p>Somme totale des soldes de tous les comptes : <xsl:value-of select="$totalSolde" /></p>

               
                <h2>Comptes créés après 2000</h2>
                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Solde</th>
                        <th>Date de création</th>
                    </tr>
                    <xsl:variable name="totalSoldeFiltré" select="sum(//getComptes[substring(dateCreation, 1, 4) &lt;= '2000']/solde)" />
                    <xsl:for-each select="//getComptes[substring(dateCreation, 1, 4) <= '2000']">
                        <tr>
                            <td><xsl:value-of select="code" /></td>
                            <td><xsl:value-of select="solde" /></td>
                            <td><xsl:value-of select="dateCreation" /></td>
                        </tr>
                    </xsl:for-each>
                </table>

                
                <p>Somme totale des soldes des comptes créés après 2000 : <xsl:value-of select="$totalSoldeFiltré" /></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
