<?xml version="1.0" encoding="UTF-8"?>
<!-- Grupo 05 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="registro">

    <html>
      <!-- Asignar estilo css-->
    <link rel="stylesheet" type="text/css" href="estilo.css" />
    <title>Facturas Grupo 05</title>
    <body>
      <h1>Facturas</h1>
      <p>Periodo: <xsl:value-of select="@periodo"/> </p>
      <p>Responsable: <xsl:value-of select="responsable"/></p>
      <xsl:for-each select="factura">
      <table class="tabla">
        <tr><th><h2>Factura <xsl:value-of select=".//@tipo"/> </h2></th></tr>
        <tr><th></th><th>Numero: <xsl:value-of select="num"/> </th></tr>
        <tr><th><h3>Factura Para</h3> </th></tr>
        <tr><th>Nombre: <xsl:value-of select=".//nombre"/> </th></tr>
        <tr><th>Genero: <xsl:value-of select=".//@sexo"/> </th></tr>
        <tr><th> Codigo: <xsl:value-of select=".//@codigo"/> </th></tr>
        <xsl:if test=".//dui" >
        <tr><th>DUI: <xsl:value-of select=".//dui"/> </th></tr>
        </xsl:if>
        <xsl:if test=".//pasaporte" >
        <tr><th>Pasaporte: <xsl:value-of select=".//pasaporte"/> (<xsl:value-of select=".//pasaporte/@pais"/>)</th></tr>
        </xsl:if>
        <tr><th>Telefono: <xsl:value-of select=".//telefono"/> (<xsl:value-of select=".//telefono/@tipo"/><xsl:if test=".//telefono/@cia" >-<xsl:value-of select=".//telefono/@cia"/></xsl:if>)</th></tr>
        <tr><th>Email: <xsl:value-of select=".//email"/></th></tr>
        <xsl:if test=".//direccion" >
        <tr><th>Direccion: <xsl:value-of select=".//direccion/@depto"/>, <xsl:value-of select=".//direccion/@municipio"/>, <xsl:value-of select=".//casa"/> <xsl:value-of select=".//oficina"/></th></tr>
        </xsl:if>
        <tr><th>
          <table border="1" class="tabla2">
            <tr><th>Cantidad</th><th>Detalle</th><th>Precio</th><th>SubTotal</th></tr>
            <tr><th><xsl:value-of select=".//cantidad"/></th><th> <xsl:value-of select=".//detalle"/> </th><th> <xsl:value-of select=".//precio/moneda"/><xsl:value-of select=".//precio/valor"/> </th><th><xsl:value-of select=".//subtotal"/></th></tr>
            <tr><th>Total</th><th></th><th></th><th><xsl:value-of select=".//total/moneda"/> <xsl:value-of select=".//total/valor"/> </th></tr>
          </table>
        </th></tr>
        
      </table>
      </xsl:for-each>
    </body> 
    </html>
    
  </xsl:template>

</xsl:stylesheet>
