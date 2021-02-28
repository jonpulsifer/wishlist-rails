import React, {useCallback, useState} from 'react';
import {
  ActionList,
  Navigation,
  Frame as PolarisFrame,
  TopBar,
} from '@shopify/polaris';
import {
  AddProductMajor,
  CustomersMajor,
  CustomersMinor,
  GiftCardMajor,
  GiftCardMinor,
  HomeMajor,
  TeamMajor,
} from '@shopify/polaris-icons';
import {useToggle} from '@shopify/react-hooks';
import {Path} from 'foundation/Routes';

interface Props {
  children?: React.ReactNode;
}

export function Frame({children}: Props) {
  const {value: open, toggle: toggleOpen} = useToggle(false);
  const [isSearchActive, setIsSearchActive] = useState(false);
  const [searchValue, setSearchValue] = useState('');
  const handleSearchResultsDismiss = useCallback(() => {
    setIsSearchActive(false);
    setSearchValue('');
  }, []);

  const handleSearchChange = useCallback((value) => {
    setSearchValue(value);
    setIsSearchActive(value.length > 0);
  }, []);
  const navigationMarkup = (
    <Navigation location="/">
      <Navigation.Section
        items={[
          {
            label: 'Add item to wishlist',
            icon: AddProductMajor,
            url: Path.Root,
          },
        ]}
      />
      <Navigation.Section
        items={[
          {
            label: 'Home',
            icon: HomeMajor,
            url: Path.Root,
          },
          {
            label: 'Gifts',
            icon: GiftCardMajor,
            url: Path.Root,
          },
          {
            label: 'People',
            icon: CustomersMajor,
            url: Path.Root,
          },
        ]}
        separator
      />
    </Navigation>
  );

  const userMenu = (
    <TopBar.UserMenu
      actions={[{items: []}]}
      name="Bobby Tables"
      detail={undefined}
      avatar={undefined}
      initials="B"
      open={open}
      onToggle={toggleOpen}
    />
  );
  const searchResultsMarkup = (
    <ActionList
      items={[
        {content: 'Bobby Tables', icon: CustomersMinor},
        {content: 'Sega Genesis', icon: GiftCardMinor},
        {content: 'Tables Family', icon: TeamMajor},
      ]}
    />
  );

  const searchFieldMarkup = (
    <TopBar.SearchField
      onChange={handleSearchChange}
      value={searchValue}
      placeholder="Search"
      showFocusBorder
    />
  );
  const topBarMarkup = (
    <TopBar
      showNavigationToggle
      userMenu={userMenu}
      searchResultsVisible={isSearchActive}
      searchField={searchFieldMarkup}
      searchResults={searchResultsMarkup}
      onSearchResultsDismiss={handleSearchResultsDismiss}
    />
  );
  return (
    <PolarisFrame topBar={topBarMarkup} navigation={navigationMarkup}>
      {children}
    </PolarisFrame>
  );
}
