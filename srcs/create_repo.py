import requests
import subprocess
import os

# Remplace par ton token GitHub
GITHUB_TOKEN = os.getenv('GITHUB_TOKEN')

if GITHUB_TOKEN is None:
	raise ValueError("GitHub token is not defined in environment variables.")

# URL de l'API GitHub pour accéder aux dépôts
API_URL = "https://api.github.com/user/repos"

# En-têtes pour l'authentification
headers = {
	'Authorization': f'token {GITHUB_TOKEN}',
	'Accept': 'application/vnd.github.v3+json'
}

def repo_exists(repo_name):
	"""Vérifie si un dépôt avec le nom donné existe sur ton profil GitHub"""
	response = requests.get(API_URL, headers=headers)
	if response.status_code == 200:
		repos = response.json()
		for repo in repos:
			if repo['name'] == repo_name:
				return True, repo['ssh_url']
	return False, None

def create_repo(repo_name):
	"""Crée un dépôt avec le nom donné sur GitHub"""
	data = {
		"name": repo_name,
		"private": False,  # change to True si tu veux un dépôt privé
	}
	response = requests.post(API_URL, json=data, headers=headers)
	if response.status_code == 201:
		repo = response.json()
		return repo['ssh_url']
	else:
		return None

def run_shell_script_with_ssh_key(ssh_key):
	"""Exécute le script shell avec la clé SSH comme paramètre"""
	try:
		result = subprocess.run(["/home/agruet/dev/init42/srcs/generate_remote.sh", ssh_key], check=True, text=True, capture_output=True)
	except subprocess.CalledProcessError as e:
		print("An error occurred while executing the script")
		print(e.stderr)

def main():
	repo_name = input("Enter the name of the repository to create: ")

	# Vérifie si le dépôt existe déjà
	exists, ssh_url = repo_exists(repo_name)

	if exists:
		print(f"Repository '{repo_name}' already exist. SSH key: {ssh_url}")
		# Lancer le programme shell avec la clé SSH
		run_shell_script_with_ssh_key(ssh_url)
	else:
		print(f"Repository '{repo_name}' doesn't exist.")
		create = input("Are you sure you want to create the repo ? [Y,n] ").strip().lower()
		if create == 'y':
			ssh_url = create_repo(repo_name)
			if ssh_url:
				print(f"Repository created successfully. SSH key: {ssh_url}")
				# Lancer le programme shell avec la clé SSH
				run_shell_script_with_ssh_key(ssh_url)
			else:
				print("An error occurred while creating the repository.")
		else:
			print("Repository creation aborted.")

if __name__ == '__main__':
	main()
