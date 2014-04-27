#!/bin/bash
#
# Desenvolvido por: Guilherme Jr. http://www.guilhermejr.net
# Licença de uso: GPL
#

# --- Pasta onde ficam as fotos ---
pasta="/Users/guilhermejr/Dropbox/Camera Uploads"

# --- Verifica se a pasta existe --
if [ ! -d "$pasta" ]; then
	echo "Não foi possível acessar a pasta $pasta"
	echo "Verifique se o caminho está correto."
	exit 1
else
	cd "$pasta"
fi

# --- Percorre todas as imagens e vídeos da pasta ---
echo "$(find -E . -type f -iregex '.*\.(jpg|gif|png|mov|mp4)$' -maxdepth 1 | cut -c3-)" | while read arquivo; do

	# --- Verifica se existe algum arquivo para processar ---
	if [ ! -f "$arquivo" ]; then
		break
	fi

	# --- Pega ano e mês do arquivo para ver em que pasta vai ficar ---
	pastaMes=$(stat -f "%Sm" -t "%Y-%m" "$arquivo")

	# --- Se a pasta não existe cria ---
	if [ ! -d "$pastaMes" ]; then
		mkdir "$pastaMes"
	fi

	# --- Se for video cria a subpasta ---
	extensao=$(echo "$arquivo" | rev | cut -d'.' -f1 | rev)
	if [ "$extensao" = "mp4" -o "$extensao" = "mov" ]; then

		# --- Se a pasta não existe cria ---
		if [ ! -d "$pastaMes/videos" ]; then
			mkdir "$pastaMes/videos"
		fi

		# --- Move o arquivo para a pasta ---
		mv "$arquivo" "$pastaMes/videos"	

	else

		# --- Move o arquivo para a pasta ---
		mv "$arquivo" "$pastaMes"

	fi

done 