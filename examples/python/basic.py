"""
HTML to Text API - Basic Usage Example

This example demonstrates the basic usage of the HTML to Text API.
API Documentation: https://docs.apiverve.com/ref/htmltotext
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/htmltotext'

def call_htmltotext_api():
    """
    Make a POST request to the HTML to Text API
    """
    try:
        # Request body
        request_body &#x3D; {
    &#x27;html&#x27;: &#x27;&lt;!doctype html&gt; &lt;html&gt;  &lt;head&gt; &lt;title&gt;This is the title of the webpage!&lt;/title&gt; &lt;/head&gt; &lt;body&gt; &lt;p&gt;This is an example paragraph. Anything in the &lt;strong&gt;body&lt;/strong&gt; tag will appear on the page, just like this &lt;strong&gt;p&lt;/strong&gt; tag and its contents.&lt;/p&gt; &lt;/body&gt; &lt;/html&gt;&#x27;
}

        headers = {
            'x-api-key': API_KEY,
            'Content-Type': 'application/json'
        }

        response = requests.post(API_URL, headers=headers, json=request_body)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling HTML to Text API...\n')

    result = call_htmltotext_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
