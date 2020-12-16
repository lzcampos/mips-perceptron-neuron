/*

## Conjunto de entradas/saídas

-    x1  x2  a
-    1   1   2
-    2   2   4
-    3   3   6
-    4   4   8
-    5   5   10
-    6   6   12
-    7   7   14
-    8   8   16
-    9   9   18
-   10   10  20

## Conjunto de pesos

W1 = 0.3
W2 = -0.4

*/


const x1 = [1,2,3,4,5,6,7,8,9,10];
const x2 = [1,2,3,4,5,6,7,8,9,10];
const a = [2,4,6,8,10,12,14,16,18,20];
let w1 = 0.3, w2 = -0.4, taxaAprendizado = 0.001;

function treinamento(){
    let result;
    let erro;
    for(let i=0; i<10; i++){
        result = (x1[i] * w1) + (x2[i] * w2);
        erro = a[i] - result;

        console.log(`Iteração ${i+1}\nResultado esperado: ${a[i]}\nResultado obtido: ${result.toFixed(5)}`);
        console.log(`Taxa de erro: ${erro}`);
        console.log(`Peso w1 (antes da correção): ${w1}\nPeso w2: ${w2}`);

        w1 = w1 + (erro * taxaAprendizado * a[i]);
        w2 = w2 + (erro * taxaAprendizado * a[i]);

        console.log(`Peso w1 (depois da correção): ${w1}\nPeso w2: ${w2}`);
    }
}

function testeNovosValores(x1, x2, a){
    let result = x1*w1 + x2*w2;
    let erro = a - result;

    console.log(`Teste de novos valores!\nResultado esperado: ${a}\nResultado obtido: ${result}\n Taxa de erro: ${erro}`);
}

window.onload = () => {
    treinamento();
    treinamento();
    treinamento();
    treinamento();
    treinamento();
    treinamento();
    treinamento();
    treinamento();
    treinamento();

    testeNovosValores(20, 20, 40);
}