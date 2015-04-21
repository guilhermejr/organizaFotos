Eu uso o OneDrive para realizar os backups dos meus arquivos mais importantes, e
utilizo a função “Backup da Câmera” para fazer o backup das fotos tiradas pelo
iPhone e iPad.

O problema é que depois de um tempo a pasta fica cheia de arquivos e fica
difícil encontrar uma foto especícica.

Para organizar essas fotos desenvolvi esse pequeno Shell Script que cria uma
pasta no formato “YYYY-mm” para guardar as fotos tiradas naquele mês, e se for o
caso cria uma subpasta chamada “videos” para guardar os vídeos do mês.

Como utilizo OS X Yosemite esse Shell Script foi desenvolvido e testado para
ele, não sei se vai funcionar em outras versões do OS X nem se vai funcionar em
alguma distribuição Linux. Caso você teste e funcione por favor me avise.

Para executar o script você só vai precisar editar a linha 8 onde tem a variável
com o caminho para a pasta onde ficam as fotos

	pasta=“/Users/guilhermejr/OneDrive/Imagens/Imagens da Câmera/”

Depois é só mudar a permissão do arquivo e executa-lo

	$ chmod 755 organizaFotos.sh 
	$ ./organizaFotos.sh 

Para não ter que ficar rodando o script manualmente coloquei ele no cron para 
executar todos os dias as 00:00h.

Dúvidas e Sugestões favor mandar um e-mail falecom@guilhermejr.net
