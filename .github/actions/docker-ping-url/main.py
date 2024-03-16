import requests
import time
import os

def ping_url(url, delay, max_trials):
    """
    Ping a URL repeatedly until it returns a response code of 200 or the maximum number of trials is reached.

    Parameters:
        url (str): The URL to ping.
        delay (int): The delay in seconds between each trial.
        max_trials (int): The maximum number of trials.

    Returns:
        bool: True if the URL returns a response code of 200 within the maximum number of trials, False otherwise.
    """
    num_trials = 0
    while num_trials < max_trials:
        try:
            response = requests.head(url)
            if response.status_code == 200:
                return True
            else:
                time.sleep(delay)
                num_trials += 1
        except Exception as e:
            print("Error occurred:", e)
            time.sleep(delay)
            num_trials += 1

    return False

def run():
    """
    Retrieve input values via environment variables and call the ping_url function.

    Raises:
        Exception: If the return value of ping_url is False.
    """
    # Retrieve input values from environment variables
    url = os.environ.get('INPUT_URL')
    delay = int(os.environ.get('INPUT_DELAY', '5'))  # Default delay is 5 seconds
    max_trials = int(os.environ.get('INPUT_MAX_TRIALS', '10'))  # Default max_trials is 10

    # Call ping_url function with retrieved arguments
    if not ping_url(url, delay, max_trials):
        raise Exception("URL is not reachable within the maximum number of trials.")

if __name__ == "__main__":
    run()
