

function fazerCadastro() {
    alert("Cadastro concluído com sucesso! Faça o login para entrar na conta")
    document.getElementById("voltarLogin").style.display = 'block'
  
}


function fazerLogin() {

    const nomeCadastro = document.getElementById("inputNomeCadastro").value  
    const usernameCadastro = document.getElementById("inputUsernameCadastro").value  
    const senhaCadastro = document.getElementById("inputSenhaCadastro").value
    
    const username = document.getElementById("inputUsernameLogin").value  
    const password = document.getElementById("inputSenhaLogin").value 

    if ( (usernameCadastro == username) && (senhaCadastro == password) ) {
        alert(`Bem vindo, ${nomeCadastro}`)
    } else if ( (username == 'mundo_verde') && (password == 'vegetais') ) {
        alert("Login efetuado com sucesso")
    } else{
        alert("Dados incorretos!")
    }
    
}