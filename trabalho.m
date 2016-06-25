pkg load image

a = imread("imagem2.jpg");
A = im2double(a);
M = size(a,1);
N = size(a,2);
soma = 0;

figure, imshow(a);
intensidadeMediaDaImagem =256;

function saida = media(imagem, M, N)
  soma = 0;
  for i=  1:M
    for j= 1:N
      soma = imagem(i,j)+soma;  
    endfor
   endfor
   M=M+1;
   N=N+1;
  saida = soma/(M*N);
endfunction
  
  
do
  saida =media(A,M, N);
  
  imagemSecundaria = a(a<=saida)=120 ;
  figure, imshow(imagemSecundaria);
  
  imagemAuxiliar = a;
  abaixoDoLimiar = imagemAuxiliar(imagemAuxiliar<=saida);
  acimaDoLimiar = imagemAuxiliar(imagemAuxiliar>saida);

  intensidadeMediaDaImagemAbaixoDoLimiar = media(abaixoDoLimiar, size(abaixoDoLimiar,1), size(abaixoDoLimiar,2));

  intensidadeMediaDaImagemAcimaDoLimiar = media(acimaDoLimiar,size(acimaDoLimiar,1), size(acimaDoLimiar,2));

  saida = (1/2)*(intensidadeMediaDaImagemAbaixoDoLimiar+intensidadeMediaDaImagemAcimaDoLimiar);

until (intensidadeMediaDaImagem<=50);




