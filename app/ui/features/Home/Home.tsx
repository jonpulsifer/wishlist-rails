import React from 'react';
import {CalloutCard, Layout, Page} from '@shopify/polaris';
import {Path} from 'foundation/Routes';
import {logoGlyph} from 'foundation/illustrations';

export default function Home() {
  return (
    <Page
      title="Manage your gift ideas"
      subtitle="wishin.app makes it easy for everyone in your family to exchange gift ideas for an event, holiday, or for literally any other reason you might have to give someone a present."
    >
      <Layout>
        <Layout.Section>
          <CalloutCard
            title="Welcome back to wishin.app, Bobby!"
            illustration={logoGlyph}
            primaryAction={{
              content: 'Explore Gifts',
              url: Path.Root,
            }}
            onDismiss={() => {}}
          >
            <p>Welcome back to the Wishlist App.</p>
            <p>
              This year we have a fresh new design and a lot of fun new
              features.
            </p>
          </CalloutCard>
        </Layout.Section>
      </Layout>
    </Page>
  );
}
