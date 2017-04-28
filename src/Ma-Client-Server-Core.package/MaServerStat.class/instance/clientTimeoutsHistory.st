historys
clientTimeoutsHistory
	"This history describes how often clients timed out.  When a request completes its lifecycle with no errors, a score of 0 is given.  When a network error occurs receiving the request or sending the response, a score of 1 is added.  Therefore, the sum is the total number of timeouts, #mean is how often they timed out."
	^ clientTimeoutsHistory