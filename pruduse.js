window.assEventListener("load", function(){


    document.getElementById("filtrare").onclick = function(){
        var inpNume= document.getElementById("inp-nume").value.toLowerCase().trim;



        var radioCalorii = document.getElementsByName("gr_rad")
        let inpCalorii;
        for(let rad of radioCalorii){
            if(rad.checked){
                inpCalorii=rad.value;
                break;
            }
        }



        var produse = document.getElementsByClassName("produs")
        for(let produs of produse){

            let valNume = produs.getElementsByClassName("val-nume")[0].innerHTML.toLowerCase().trim()

            let cond1 = valNume.startsWith(inpNume)

            let cond2 = true;

            if(cond1 && cond2)
                produs.style.display="block";
            else
                produs.style.display="none";

            console.log(valNume)
        }


    }



})