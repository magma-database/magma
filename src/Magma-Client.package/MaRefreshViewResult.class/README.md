A MaRefreshViewResult is the result object returned to the client upon crossing a transaction boundary where no transaction was present; i.e., not in a transaction, then doing an begin or abort.

Instance Variables
	connection : The MagmaClientConnection object identifying my client.

	isSystem : A Boolean indicating whether my client is the one used by the repository-controller.

	toBeRefreshed : The Dictionary of objects accumulated from other clients transactions that now need to be refreshed by my client.  It is the latest individual MaObjectBuffers keyed by their oid.

	commitNumber : The number of commits made to the persistent model.