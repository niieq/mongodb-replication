Mongo DB Master/Slave
========================

Implement Master and Slave replication in Mongo DB

Usage
-----

.. code-block:: bash
	
	$ vagrant up


	# To View Sample Data in slave

	$ vagrant ssh slave

	$ mongo 192.168.33.12

	$ set0:SECONDARY> rs.slaveOk()

	$ db.students.find()


	# To Back Up

	# SSH into slave

	$ vagrant ssh slave

	# Execute Backup Script
	$ ./backup.sh 

	NB: Backups is done on replicas
