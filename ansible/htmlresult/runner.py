import ansible_runner
r = ansible_runner.run(private_data_dir='tmp', playbook='/home/nimish/rahulbali/test-nim.yml')
print("{}: {}".format(r.status, r.rc))
# successful: 0

print(r)

for each_host_event in r.events:
    print(each_host_event['event'])
print("Final status:")
print(r.stats)
