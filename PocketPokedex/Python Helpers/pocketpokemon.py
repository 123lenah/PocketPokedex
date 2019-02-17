# youtube.py
#
# ICS 32 Winter 2019
# Code Example
#
# This program issues a search for YouTube videos, given a particular
# search query like "lakers clippers".

import json
import urllib.parse
import urllib.request
import requests

# All of the services provided by the YouTube Data API have URLs that
# begin like this; it's simply a matter of adding the rest of the URL
# and its query parameters to the end of this.
BASE_POKEMON_URL = 'https://pokeapi.co/api/v2/pokemon/'



def build_search_url(pokemon: str) -> str:
    '''
    This function takes a search query and the maximum number of results
    to display, and builds and returns a URL that can be used to ask the
    YouTube Data API for information about videos matching the search
    request.
    '''

    # Here, we create a list of two-element tuples, which we'll convert to
    # URL query parameters using the urllib.parse.urlencode function.  The
    # reason we do this, rather than building the URL string ourselves, is
    # because there is a fair amount of complexity -- dealing with special
    # characters, etc. -- that will be difficult to get precisely correct,
    # but that urllib.parse.urlencode already knows how to do correctly.
    #query_parameters = [
    #    ('key', GOOGLE_API_KEY), ('part', 'snippet'),
    #    ('type', 'video'), ('maxResults', str(max_results)),
    #    ('q', search_query)
    #]
    #print(BASE_POKEMON_URL + pokemon + '/')
    return BASE_POKEMON_URL + pokemon + '/'



def get_result(url: str) -> dict:
    '''
    This function takes a URL and returns a Python dictionary representing the
    parsed JSON response.
    '''
    response = None

    try:
        # Here, we open the URL and read the response, just as we did before.
        # After the second line, json_text will contain the text of the
        # response, which should be in JSON format.
        response = requests.get(url)
        data = response.json()
        dataStr = json.dumps(data)
        #json_text = response.read().decode(encoding = 'utf-8')

        # Given the JSON text, we can use the json.loads() function to convert
        # it to a Python object instead.
        
        return json.loads(dataStr)
    except Exception as e:
        print(str(e))
    finally:
        # We'd better not forget to close the response when we're done,
        # assuming that we successfully opened it.
        if response != None:
            response.close()


def run() -> None:
    search_query = input('Query: ')
    while search_query != 'q':  
        result = get_result(build_search_url(search_query))
        if result == None:
            print('Pokemon not found')
        else:
            print('name: ' + result['name'] + '\ntype(s): ' )
            for i in range(len(result['types'])):
                print(result['types'][i]['type']['name'])
        print()
        search_query = input('Query: ')


if __name__ == '__main__':
    run()
