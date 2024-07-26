Crearea unei Infrastructuri în Azure cu Terraform
Unul dintre obiectivele principale ale stagiului de practica in cadrul firmei IBM a fost realizarea unei infrastructuri în Azure, utilizând Terraform pentru aprovizionarea și gestionarea resurselor necesare. Activitățile specifice au inclus:

1.	Definirea Resurselor de Infrastructură:
o	Am început prin crearea unui fișier de configurare Terraform, în care am definit toate resursele necesare. Acestea au inclus:
	Resource Groups: Am creat grupuri de resurse pentru a organiza și gestiona resursele Azure.
	VNet și Subnet: Am configurat o rețea virtuală (Virtual Network) și subrețele asociate pentru a permite comunicarea internă între resurse.
	Public IP și Network Interfaces: Am configurat adrese IP publice și interfețe de rețea pentru mașinile virtuale, asigurând conectivitatea și accesibilitatea acestora.
	Linux Virtual Machines: Am creat mașini virtuale Linux, folosind Terraform pentru a automatiza procesul de aprovizionare.
	Random Password Generator: Am utilizat generatorul de parole random al Terraform pentru a crea parole sigure și unice pentru mașinile virtuale.

2.	Crearea a Două Mașini Virtuale Folosind Funcția Count în Terraform:
o	Am configurat Terraform pentru a crea cel puțin două mașini virtuale, utilizând funcția count. Acest lucru a permis replicarea configurației pentru mai multe instanțe, facilitând scalabilitatea și gestionarea eficientă a resurselor.

3.	Realizarea unui Script în Terraform pentru Comanda Ping între Mașini Virtuale:
o	Pentru a demonstra conectivitatea între mașinile virtuale create, am dezvoltat un script Terraform folosind resursa null_resource și funcția remote-exec. Scriptul a fost configurat pentru a executa comanda ping dintr-o mașină virtuală către adresa IP a celeilalte mașini virtuale. Această activitate a implicat:
	Configurarea resursei null_resource pentru a defini acțiunea de execuție la distanță.
	Scrierea scriptului de ping și integrarea acestuia în configurația Terraform.
	Testarea scriptului pentru a verifica succesul comunicării între mașinile virtuale.
