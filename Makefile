	 # --ask-become-pass
dot:
	@sudo -v && ansible-playbook dot.yml
	@notify-send "Congratulation, you have been dotfiled!"
