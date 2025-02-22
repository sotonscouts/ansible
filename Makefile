.PHONY: all clean

CMD:=poetry run
ANSIBLE_PLAYBOOK_ENTRYPOINT:=main.yml

all: lint

lint: 
	$(CMD) ansible-playbook  --syntax-check $(ANSIBLE_PLAYBOOK_ENTRYPOINT)
	$(CMD) ansible-lint $(ANSIBLE_PLAYBOOK_ENTRYPOINT)

clean:
	git clean -Xdf # Delete all files in .gitignore