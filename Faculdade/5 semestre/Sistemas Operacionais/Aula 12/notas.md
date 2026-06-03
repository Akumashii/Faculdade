# Gerência de memória

multiprogramação -> varios processos para excecução, para troca de contexto rapida processos na memória principal (RAM)

Gerencia -> prover mecanismos para utilizar a memória de forma segura e eficiente, há varias técnicas de gerência
- cada SO emprega uma técnica em particular e depende fortemente da arquitetura do processador

três tipos de memória 
- cache -> inserida no processador, a mais rápida
- RAM -> memória principal, rápida
- hd/ssd -> memória secundária, mais lenta que as demais

memória = vetor de palavras ou vetor de bytes e seus endereços  
gerência de memória = 


Fila de entrada = coleção de processos no disco esperando para serem carregados na memória
procedimento normal = 

os espaços no computador começcam em 00000 mas o endereço de um processo de usuario não precisa ser 00000

endereço de diferentes formas e diferentes mapeamentos. cada associção é um mapeamente de um espaço de endereço para outro

## Mapeamento de Endereços
1) tempo de compilação
2) tempo de carga
3) tempo de execução

## Espaço de Endereçamento - Lógico x Físico

lógica

física -> implementada pelos circuitos integrados na memória, usado para endereçar os circuitos integrados

MMU é um componente do hardware. CPU -(endereço lógico)-> MMU -(Endereço Físico)-> memória

## Proteção de memória

Realizada pelo MMU, intermediário entre a CPU e Memória
- Registradores de Limite - definide o espaço de endereçamento lógico do processo; considera que os endereços lógicos e físicos são identicos
- Registrador Base - inicia no valor do Registrador Base e tem o tamanho da memória lógica do processo (limite); considera que os endereços lógicos e físicos são diferentes
- Registradores Base e Limite - devem ser protegidos e acessados no modo supervisor; parte do contexto do processo (PCB); troca de contexto: os valores dos registrados são copiado do PCB para os registradores MMU

## swapping

swapping -> troca

um processo pode ser removido da memória principal temporariamente para um armazenamento auxiliar (disco rígido), geralmente quando o processo hiberna, fica ocioso, e retomado à memória para continuar a execução

Geralmente, um processo que é descarregado será carregado no mesmo espaço de memória que ocupava anteriormente

troca requer armazenamento auxiliar

SO mantém Fila de processos prontos ->
