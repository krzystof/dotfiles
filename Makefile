dot:
	@sudo -v && ansible-playbook dot.yml
	@notify-send "Congratulation, you have been dotfiled!"

wip:
	@sudo -v && ansible-playbook wip.yml
	@notify-send "Wipfiled"
