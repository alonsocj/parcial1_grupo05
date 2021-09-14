<?xml version="1.0" encoding="UTF-8"?>
<!-- Grupo 05 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="registro">

    <html>
      <!-- Asignar estilo css-->
      <link rel="stylesheet" type="text/css" href="estilo.css" />
      <title>Facturas Grupo 05</title>
      <h1>Facturas</h1>
        <p><b> Periodo: </b><xsl:value-of select="@periodo"/> </p>
        <p><b> Responsable: </b><xsl:value-of select="responsable"/></p>
      <xsl:for-each select="factura">    
        <body>
          <p><br/></p>
          <table class="tabla">
            <tr><td colspan="2"><b>Factura No. </b><u><xsl:value-of select=".//num"/></u>______ 
              <b>Tipo: </b> <xsl:if test=".//@tipo = 'final'" >Consumidor <xsl:value-of select=".//@tipo"/></xsl:if>
              <xsl:if test=".//@tipo = 'credito'" >comprobante de <xsl:value-of select=".//@tipo"/> fiscal</xsl:if>
            </td></tr>
            <tr><th><h3>Cliente</h3> </th></tr>
            <tr><td><b> Nombre: </b><xsl:value-of select=".//nombre"/> </td><td><b> Genero: </b><xsl:value-of select=".//@sexo"/> </td></tr>
            <tr>
              <xsl:if test=".//dui" >
                <td><b> DUI: </b><xsl:value-of select=".//dui"/> </td>
              </xsl:if>
              <xsl:if test=".//pasaporte" >
                <td><b> Pasaporte: </b><xsl:value-of select=".//pasaporte"/> (<xsl:value-of select=".//pasaporte/@pais"/>)</td>
              </xsl:if>
              <td><b> Codigo: </b><xsl:value-of select=".//@codigo"/> </td>
          </tr>
          <tr>
            <td><b> Telefono: </b><xsl:value-of select=".//telefono"/> (<xsl:value-of select=".//telefono/@tipo"/><xsl:if test=".//telefono/@cia" >-<xsl:value-of select=".//telefono/@cia"/></xsl:if>)</td>
            <td><b> Email: </b><xsl:value-of select=".//email"/></td>
          </tr>
            <xsl:if test=".//direccion" >
            <tr><td colspan="2"><b> Direccion: </b><xsl:value-of select=".//direccion/@depto"/>, <xsl:value-of select=".//direccion/@municipio"/>, <xsl:value-of select=".//casa"/> <xsl:value-of select=".//oficina"/></td></tr>
            </xsl:if>
            <tr><th  colspan="2">
              <table border="1" class="tabla2">
                <tr class="color"><th>Código</th><th>Cantidad</th><th>Detalle</th><th>Precio</th><th>SubTotal</th></tr>
                <tr><td><xsl:value-of select=".//codigo"/></td><td><xsl:value-of select=".//cantidad"/></td><td> <xsl:value-of select=".//detalle"/> </td><td><xsl:value-of select=".//precio"/></td><td><xsl:value-of select=".//subtotal"/></td></tr>
                <tr><th colspan="4" class="der">Total</th><td><xsl:value-of select=".//total"/> </td></tr>
              </table>
            </th></tr>
          </table>
        </body> 
      </xsl:for-each>
    </html>
    
  </xsl:template>

</xsl:stylesheet>
