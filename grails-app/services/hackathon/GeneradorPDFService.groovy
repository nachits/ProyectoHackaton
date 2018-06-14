package hackathon

import grails.transaction.Transactional
import org.xhtmlrenderer.layout.SharedContext
import org.xhtmlrenderer.pdf.ITextRenderer

@Transactional
class GeneradorPDFService {
    def groovyPagesTemplateEngine
    
    def template(String plantillaHtml) {
        plantillaHtml = "<%@page defaultCodec=\"html\" %>" + plantillaHtml
        groovyPagesTemplateEngine.createTemplate(plantillaHtml, 'reporte1')
    }
    byte[] generarPDFconHTML(String plantillaHtml, def model) {
        def template = template(plantillaHtml)
        html2pdf(base(template, model))
    }
    
    String base(def template, def model) {
        def renderedTemplate = template.make(model)
        StringWriter stringWriter = new StringWriter()
        renderedTemplate.writeTo(stringWriter)

        String html = """
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<style>
@media print {
  table { page-break-after:auto }
  tr    { page-break-inside:avoid; page-break-after:auto }
  td    { page-break-inside:avoid; page-break-after:auto }
  thead { display:table-header-group }
  tfoot { display:table-footer-group }
}

@page {
  size: letter;
}
</style>
</head>

<body>
${stringWriter.toString()}
</body>
</html>
"""
    }
    byte[] html2pdf(String html) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()
        byte[] bytes = null
        ITextRenderer renderer = new ITextRenderer()
        SharedContext sharedContext = renderer.getSharedContext()
        sharedContext.setPrint(true)
        sharedContext.setInteractive(false)
        sharedContext.getTextRenderer().setSmoothingThreshold(0)
        try {
            renderer.setDocumentFromString(html)
            renderer.layout()
            renderer.createPDF(byteArrayOutputStream)
            bytes = byteArrayOutputStream.toByteArray()
        }
        catch (Throwable e) {
            log.error("Error while generating pdf ${e.message}", e)
        }
        return bytes
    }
    
}
