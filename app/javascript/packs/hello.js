console.log('Hello from My JS')
document.addEventListener('turbolinks:load', () => {
    const findCep = () => {
        const cep = document.getElementById("cep").value;
        
    }
    document.getElementById("cep").addEventListener('focusout', findCep);
    
});
