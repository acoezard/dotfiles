# Se connecter au serveur
ssh axelcoezard@51.210.148.5 -p 25565

# Lancer un server serve en fond
(sudo PORT=80 npx serve -s ./build &)

# Pour le tuer, executer la commande
sudo ps -e | grep node

# trouver le PID du processus node et faire:
sudo kill -9 <PID>
