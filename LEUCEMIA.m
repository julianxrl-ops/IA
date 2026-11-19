clc; clear all; close all;
he=imread("WBC-Malignant-Pro-058.jpg");
imshow(he); title("imagen original");
areanum=50;
%
%
numColors = 3;
L = imsegkmeans(he,numColors);
B = labeloverlay(he,L);
imshow(B)
title("Labeled Image RGB")
%
lab_he = rgb2lab(he);
%
ab = lab_he(:,:,2:3);
ab = im2single(ab);
pixel_labels = imsegkmeans(ab,numColors,NumAttempts=3);
%
B2 = labeloverlay(he,pixel_labels);
imshow(B2)
title("Labeled Image a*b*")
%
    mask1 = pixel_labels == 1;
    cluster1 = he.*uint8(mask1);
    imshow(cluster1)
    title("Objects in Cluster 1");
    m = 0;
for i = 1:size(cluster1, 1)
  for j = 1:size(cluster1, 2)
    if cluster1(i, j) ~= 0
      m = m + 1;
    end
  end
end

  % Devolver el resultado
 fprintf('1. Cantidad de pixeles: %d\n', m);
imagen_gris1 = rgb2gray(cluster1);
umbral1 = graythresh(imagen_gris1);
imagen_umbralizada1 = imbinarize(imagen_gris1, umbral1);
etiquetas1 = bwlabel(imagen_umbralizada1);num_objetos1 = max(etiquetas1(:));
% Calcular propiedades de las regiones etiquetadas
propiedades1 = regionprops(etiquetas1, 'Area');
% Contar el número de objetos con un tamaño mayor a 20 píxeles
num_objetos_grandes1 = sum([propiedades1.Area] > areanum);
subplot(1, 2, 1);
imshow(cluster1);title('Imagen Original');
subplot(1, 2, 2);
imshow(imagen_umbralizada1);title('Imagen Umbralizada');
fprintf('Número de objetos en la imagen: %d\n', num_objetos_grandes1);
tam1=m/num_objetos_grandes1;
fprintf('Tamaño aprox por célula: %d\n', round(tam1));

%%
    mask2 = pixel_labels == 2;
    cluster2 = he.*uint8(mask2);
    imshow(cluster2)
    title("Objects in Cluster 2");
        n = 0;
    for i = 1:size(cluster2, 1)
      for j = 1:size(cluster2, 2)
        if cluster2(i, j) ~= 0
          n = n + 1;
        end
      end
    end
fprintf('2. Cantidad de pixeles: %d\n', n);
% Convertir la imagen a escala de grises
imagen_gris = rgb2gray(cluster2);
umbral = graythresh(imagen_gris);
imagen_umbralizada = imbinarize(imagen_gris, umbral);
etiquetas = bwlabel(imagen_umbralizada);num_objetos = max(etiquetas(:));

propiedades = regionprops(etiquetas, 'Area');
num_objetos_grandes2 = sum([propiedades.Area] > areanum);

subplot(1, 2, 1);
imshow(cluster2);title('Imagen Original');
subplot(1, 2, 2);
imshow(imagen_umbralizada);title('Imagen Umbralizada');
fprintf('Número de objetos en la imagen: %d\n', num_objetos_grandes2);
tam2=n/num_objetos_grandes2;
fprintf('Tamaño aprox por célula: %d\n', round(tam2));
   

%%
    mask3 = pixel_labels == 3;
    cluster3 = he.*uint8(mask3);
    imshow(cluster3)
    title("Objects in Cluster 3");

        a = 0;
    for i = 1:size(cluster3, 1)
      for j = 1:size(cluster3, 2)
        if cluster3(i, j) ~= 0
          a = a + 1;
        end
      end
    end
fprintf('3. Cantidad de pixeles: %d\n', a);
imagen_gris3 = rgb2gray(cluster3);
umbral3 = graythresh(imagen_gris3);
imagen_umbralizada3 = imbinarize(imagen_gris3, umbral3);
etiquetas3 = bwlabel(imagen_umbralizada3);num_objetos3 = max(etiquetas3(:));

propiedades3 = regionprops(etiquetas3, 'Area');
num_objetos_grandes3 = sum([propiedades3.Area] > areanum);

subplot(1, 2, 1);
imshow(cluster3);title('Imagen Original');
subplot(1, 2, 2);
imshow(imagen_umbralizada3);title('Imagen Umbralizada');
fprintf('Número de objetos en la imagen: %d\n', num_objetos_grandes3);
tam3=a/num_objetos_grandes3;
fprintf('Tamaño aprox por célula: %d\n', round(tam3));

%% Características halladas 

% Pixeles: Cantidad de pixeles morados
% Cantidad: cantidad de células
% Tamano: Tamaño de las celulas aproximado 

Pixeles_Benignos= [6130, 5241, 3327, 3401, 1887, 5754, 4626, 4255, 2214, 5832];
Cantidad_benignos= [20 ,23, 11 ,10 ,8 ,23 ,15 ,10 ,6 , 13];
Tamano_benignos= [307,228,302,340,236,250,308,426,369,449];

Pixeles_early= [2850,3717,4130,1815,3267,5370,3087,3575,4533,5415];
Cantidad_early= [7,10,10,4,7,11,4,7,14,9];
Tamano_early= [407,372,413,454,467,488,772,511,324,602];

Pixeles_pre= [459,9669,11167,10780,786,1822,9044,1831,8155,11169];
Cantidad_pre= [1,8,12,8,1,3,13,3,6,13];
Tamano_pre= [459,1209,931,1348,786,607,696,610,1359,859];

Pixeles_pro= [1501,3125,1806,1558,1061,1330,1589,1449,1996,1239];
Cantidad_pro= [3,7,5,4,3,5,4,3,3,3];
Tamano_pro= [500,446,361,390,354,266,397,483,665,413];






