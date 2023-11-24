# ERLOGLIB-TP
Bibliothèque en Turbo Pascal pour la gestion des erreurs (errorlog).

<h3>Liste des fonctions</h3>

Voici la liste des fonctions reconnus dans l'unité ERRLOGTP :

<table>
	<tr>
		<th>Nom</th>
		<th>Description</th>
	</tr>
  <tr>
    <td><b>GetFileNameAccess</b></td>
    <td>Cette fonction permet de demander le nom du fichier des accès du journal de bord (access log).</td>
  </tr>
  <tr>
    <td><b>GetFileNameError</b></td>
    <td>Cette fonction permet de demander le nom du fichier des erreurs du journal de bord (error log).</td>
  </tr>
  <tr>
    <td><b>SendAccessMessage</b></td>
    <td>Cette procédure permet d'ajouter un message d'accès dans le journal de bord (access log).</td>
  </tr>
  <tr>
    <td><b>SendErrorMessage</b>
      <td>Cette procédure permet d'ajouter un message d'erreur dans le journal de bord (error log).</td>
  </tr>
  <tr>
    <td><b>SetFileNameAccess</b>
    <td>Cette fonction permet de fixer le nom du fichier des accès du journal de bord (access log).</td>
  </tr>
  <tr>
    <td><b>SetFileNameError</b>
    <td>Cette fonction permet de fixer le nom du fichier des erreurs du journal de bord (error log).</td>
  </tr>
</table>

<h3>Remarque</h3>
<ul>
	<li>Par défaut, sous Linux, il écrit dans le répertoire «/var/log/» les fichiers d'accès et d'erreur.</li>
</ul>
