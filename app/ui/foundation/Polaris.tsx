import React from 'react';
import {Link} from '@shopify/react-router';
import {AppProvider} from '@shopify/polaris';
import {useI18n} from '@shopify/react-i18n';

import {logo, logoInverted} from './illustrations';

interface Props {
  children?: React.ReactNode;
}

export function Polaris({children}: Props) {
  const [i18n] = useI18n({
    id: 'Polaris',
    translations: async (code) => {
      return import(`@shopify/polaris/locales/${code}.json`);
    },
  });
  const theme = {
    logo: {
      width: 175,
      topBarSource: logo,
      url: 'https://wishin.app',
      accessibilityLabel: 'Wishin.app',
      contextualSaveBarSource: logoInverted,
    },
  };

  return (
    <AppProvider i18n={i18n.translations} linkComponent={Link} theme={theme}>
      {children}
    </AppProvider>
  );
}
