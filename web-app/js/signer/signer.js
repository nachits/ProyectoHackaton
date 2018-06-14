// Función para firmar los documentos. Como parámetros, esta necesita
// la una lista con los id's de los documentos a firmar (un string con los valores separados por ",")
// y la contraseña del certificado.


function mySignDocuments(documentIDs, keyword) {   
    var funcEx = isFunc("comienzaFirma");
    if(funcEx)
        comienzaFirma();
    
    var key= document.getElementById("signer-ie");
    
    if(!ismsi()) {
        appsigner = document.getElementById("signer");
    }else{
       appsigner = document.getElementById("signer-ie"); 
    }
    //var url = location.protocol+"//"+location.hostname+":"+location.port+"/"+"SEGRD_UI";
    var url = location.protocol+"//"+document.domain+":"+location.port+"/"+"SEGRD_UI";
    if(!keyword || !documentIDs){
        alert("Debe ingresar contraseña y seleccionar al menos una resolución")
        return false
    }
    appsigner.setUrlBase(url);
    appsigner.sign("", keyword, documentIDs);
}

function signDocuments(documentIDs, keyword) {    
    var appsigner = document.getElementById("signer-ie");
    if(!ismsi()) {
        appsigner = document.getElementById("signer");
    }
    appsigner.setUrlBase("http://10.0.8.72/DNP_Engine");
    appsigner.sign("", keyword, documentIDs);
}

var isFunc = function(func){ return typeof window[func] === "function";}

/**
 * Indica que ocurrio un error y disponibilisa el mensaje de error.
 * @param {type} err
 * @returns {undefined}
 */
function showError(err) {
    var funcEx = isFunc("errorAlFirmar");
    if(funcEx)
        errorAlFirmar(err);
}

/**
 * Termino de firmarmar y queda listo para un nuevo proceso de firma.
 * @returns {undefined}
 */
function readyForNext() {
    var funcEx = isFunc("terminaDeFirmar");
    if(funcEx)
        terminaDeFirmar();
}


//TODO: revisar http://stackoverflow.com/a/21375547
/* Funciones requeridas por el Applet */
// Habilita las funcionalidades para firmar.
// Este método es llamado cuando el applet comienza a ejecutarse
function enableSigner() {
    var funcEx = isFunc("enableSig");
    if(funcEx)
        enableSig();
}

// Actualiza el texto del cuadro de progreso definido en el sitio.
// Este método es llamado cuando se está descargando, finalizando o firmando los documentos.
function updateProgressDialogText(text) {
    var funcEx = isFunc("progressDialog");
    if(funcEx)
        progressDialog(text);
}

// Función obtenida desde aquí: http://stackoverflow.com/a/19999868
//Se agrega soporte para ie 11 http://solvedstack.com/questions/jquery-check-if-user-is-using-ie

function ismsi() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");
    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) 
    // If Internet Explorer, return true
        return true;
    else
    // If another browser, return false
    return false;
}
