import React from 'react';
import {Router} from '@shopify/react-router';
import {NetworkUniversalProvider, Header} from '@shopify/react-network';

import {Frame} from './Frame';
import {I18n} from './I18n';
import {Polaris} from './Polaris';
import {Routes} from './Routes';

export function App({url}: {url: URL}) {
  return (
    <NetworkUniversalProvider headers={[Header.AcceptLanguage]}>
      <I18n>
        <Polaris>
          <Router location={url}>
            <Frame>
              <Routes />
            </Frame>
          </Router>
        </Polaris>
      </I18n>
    </NetworkUniversalProvider>
  );
}
