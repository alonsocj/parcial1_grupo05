<?xml version="1.0" encoding="UTF-8"?>
<!-- Grupo 05 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="registro">
  <html>
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Facturas Grupo 05</title>
      <meta name="author" content="Miguel Angel Amaya Rodriguez">
      <meta name="author" content="Christian Javier Ayala Guerra">
      <meta name="author" content="Diego José Ayala Guerra">
      <meta name="author" content="Luis Alonso Cornejo Jiménez">
      <meta name="author" content="Carolina Isabel Pineda Delgado">
      <meta name="author" content="José Gustavo Pineda Delgado">
      <meta name="author" content="William Enrique Vásquez Mancia">
      <meta name="keywords" content="XML, XSD, CSS, HTML, XSL">
      <meta name="description" content="Examen Parcial 1 TPI115-2021">
      <title>Facturas Grupo 05</title>
      <!-- Asignar estilo css-->
      <link rel="stylesheet" type="text/css" href="estilo.css" />
    </head>
    <body>
      <h1>Facturas</h1>
      <p class="texto">Periodo <xsl:value-of select="@periodo"/> </p>
      <p class="texto"> Responsable: <xsl:value-of select="responsable"/></p>
      <xsl:for-each select="factura">    
        <table class="tabla">
          <tr><td colspan="2"><p class="negrita"> Factura No. </p><p class="subrayado"><xsl:value-of select=".//num"/>______</p> 
            <p class="negrita"> Tipo: </p> <p class="normal"> <xsl:if test=".//@tipo = 'final'" >Consumidor <xsl:value-of select=".//@tipo"/></xsl:if>
            <xsl:if test=".//@tipo = 'credito'" >comprobante de <xsl:value-of select=".//@tipo"/> fiscal</xsl:if></p>
          </td></tr>
          <tr><th colspan="2">Cliente</th></tr>
          <tr><td><p class="negrita"> Nombre: </p><xsl:value-of select=".//nombre"/> </td><td><p class="negrita"> Genero: </p><xsl:value-of select=".//@sexo"/> </td></tr>
          <tr>
            <xsl:if test=".//dui" >
              <td><p class="negrita"> DUI: </p><xsl:value-of select=".//dui"/> </td>
            </xsl:if>
            <xsl:if test=".//pasaporte" >
              <td><p class="negrita"> Pasaporte: </p><xsl:value-of select=".//pasaporte"/> (<xsl:value-of select=".//pasaporte/@pais"/>)</td>
            </xsl:if>
            <td><p class="negrita">Codigo: </p><xsl:value-of select=".//@codigo"/> </td>
        </tr>
        <tr>
          <td><p class="negrita"> Telefono: </p><xsl:value-of select=".//telefono"/> (<xsl:value-of select=".//telefono/@tipo"/><xsl:if test=".//telefono/@cia" >-<xsl:value-of select=".//telefono/@cia"/></xsl:if>)</td>
          <td><p class="negrita"> Email: </p><xsl:value-of select=".//email"/></td>
        </tr>
          <xsl:if test=".//direccion" >
          <tr><td colspan="2"><p class="negrita"> Direccion: </p><xsl:value-of select=".//direccion/@depto"/>, <xsl:value-of select=".//direccion/@municipio"/>, <xsl:value-of select=".//casa"/> <xsl:value-of select=".//oficina"/></td></tr>
          </xsl:if>
          <tr><th colspan="2">
            <table class="tabla2">
              <tr class="color"><th>Código</th><th>Cantidad</th><th>Detalle</th><th>Precio</th><th>SubTotal</th></tr>
              <tr><td class="bordes"><xsl:value-of select=".//codigo"/></td><td class="bordes"><xsl:value-of select=".//cantidad"/></td><td class="bordes"> <xsl:value-of select=".//detalle"/> </td><td class="bordes"><xsl:value-of select=".//precio"/></td><td class="bordes"><xsl:value-of select=".//subtotal"/></td></tr>
              <tr><th colspan="4" class="der">Total</th><td class="bordes"><xsl:value-of select=".//total"/> </td></tr>
            </table>
          </th></tr>
        </table>
      </xsl:for-each>
    </body> 
    </html>
  </xsl:template>
</xsl:stylesheet>
