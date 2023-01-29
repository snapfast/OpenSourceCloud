# TERRAFORM WORKS

- Infrastructure as Code (Static Plan)
- Execution Plan (plan before action)
- Order of Execution is automatically taken care
- Use of Resource Graph (DAC) - Directed Acyclic Graph
- Each node is a resource, some internal, some from cloud provider.


# TERRAFORM GENERIC COMMANDS

```
terraform init

terraform plan

terraform plan -destroy

terraform plan -out=out.plan

terraform state list
```

> outputs the list of items in the state file

```
terraform state show {item}

terraform show
```

> see complete state file

```
terraform show -json


terraform graph
```

> use the graphviz https://webgraphviz.com

```
terraform apply

terraform apply out.plan
```

> if the state has been changed after the plan was created, the plan becomes stale for future use.


`terraform apply -auto-approve`
> careful!! use cautiously. it does not output anything.


