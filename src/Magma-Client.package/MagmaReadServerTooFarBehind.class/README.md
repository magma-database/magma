A MagmaReadServerTooFarBehind is signaled only when a higly-available, multi-server Magma node is running.  In this configuration, it is possible for the read-only servers to fall slightly behind the primary server (the one accepting commits).

Applications which cannot tolerate this may set the #requiredProgress of their MagmaSession to a known commitNumber.  All ReadRequests will include this commitNumber, and, if a secondary read-only server finds itself behind that commitNumber for a particular client read-request, the client will pause 1 second and retry once before passing the error to the application.

This will hopefully be sufficient to eliminate 100% of these kinds of errors.