'use strict';

const cepInput = document.getElementById('address_cep')

const limparFormulario = (endereco) =>{
    document.getElementById('address_street').value  = '';
    document.getElementById('address_district').value = '';
    document.getElementById('address_city').value =  '';
    document.getElementById('address_state').value = '';
}

const preencherFormulario = (endereco) =>{
    document.getElementById('address_street').value = endereco.logradouro;
    document.getElementById('address_street').setAttribute('style', 'background-color: #808080;');
    document.getElementById('address_district').value = endereco.bairro;
    document.getElementById('address_district').setAttribute('style', 'background-color: #808080;');
    document.getElementById('address_city').value = endereco.localidade;
    document.getElementById('address_city').setAttribute('style', 'background-color: #808080;');
    document.getElementById('address_state').value = endereco.uf;
    document.getElementById('address_state').setAttribute('style', 'background-color: #808080;');
    document.getElementById("address_number").focus();

}

const eNumero = (numero) => /^[0-9]+$/.test(numero);

const cepValido = (cep) => cep.length == 8 && eNumero(cep); 

const myFunction = async() => {
    limparFormulario();
    
    var cep_num = document.getElementById("address_cep").value;
    const url = `/fetch_cep?cep=${cep_num}`
    
    if (cepValido(cep_num)){
        const dados = await fetch(url);
        const endereco = await dados.json();
        if (endereco.hasOwnProperty('erro')){
            document.getElementById('address_street').value = 'CEP não encontrado!';
            document.getElementById('address_street').setAttribute('style', 'background-color: #808080;');
            document.getElementById("address_number").focus();
        }else {
            preencherFormulario(endereco);
        }
    }else{
        document.getElementById('address_street').value = 'CEP incorreto!';
        document.getElementById('address_street').setAttribute('style', 'background-color: red;');
        document.getElementById("address_number").focus();
    }
     
}
cepInput.addEventListener('focusout', myFunction);